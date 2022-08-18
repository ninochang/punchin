# Steps
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
        uses: ninoswaglive/punchin@v1
        with:
          mode: in
      - name: Punch out
        if: github.event.schedule == '0 11 * * 1-5'
        uses: ninoswaglive/punchin@v1
        with:
          mode: out

```
