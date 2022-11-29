# Dev locally
## Steps

1. Click fork
![00-Click-fork](https://user-images.githubusercontent.com/52401002/204591423-2496342a-1aba-4c28-bdeb-dfeed1e73fb1.png)
2. Create fork repo
![01-Create-fork](https://user-images.githubusercontent.com/52401002/204590775-7930251f-a9d2-4299-875e-4050086bd844.png)
3. Enable Action
![02-Enable-action](https://user-images.githubusercontent.com/52401002/204590895-3d22587b-1a55-4270-b119-804fb8966632.png)
4. Setup secretes
![03-1-Setup-secrets](https://user-images.githubusercontent.com/52401002/204590971-e1280db0-c537-49d1-8d66-0cc0b8d5f783.png)
![03-2-Create-secret](https://user-images.githubusercontent.com/52401002/204590986-2becf72a-ba34-4fdf-874f-423988a6fb12.png)
![03-3-Create-secret](https://user-images.githubusercontent.com/52401002/204591009-928b8f2e-0813-4d54-98c0-2953bf849dae.png)

# Use as Action
## Steps
1. set your repo secret
    - ACCOUNT
    - PASSWORD
2. Add action like below, put in `.github/workflows/punch.yaml` .

```yaml
name: Punch in

on:
  schedule:
    - cron: '0 0 * * 1-5'
    - cron: '0 11 * * 1-5'

jobs:
  attendence:
    name: do_punch
    runs-on: ubuntu-latest
    env:
      ACCOUNT: ${{ secrets.ACCOUNT}}
      PASSWORD: ${{ secrets.PASSWORD}}
    steps:
      - name: Checkout
        uses: actions/checkout@v3
      - name: Punch in
        if: github.event.schedule == '0 0 * * 1-5'
        uses: ninochang/punchin@v1
        with:
          mode: in
      - name: Punch out
        if: github.event.schedule == '0 11 * * 1-5'
        uses: ninochang/punchin@v1
        with:
          mode: out

```
