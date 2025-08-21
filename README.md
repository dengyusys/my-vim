# my-vim


## vim


## wezterm


## powershell



## git

虽然这个配置可以保证git被代理,但是会影响内部的配置

```shell
  # 查看
  git config --global http.proxy
  git config --global https.proxy

  # 设置
  git config --global http.proxy http://127.0.0.1:7897
  git config --global https.proxy http://127.0.0.1:7897


```
 设置默认编辑器，避免使用git内置的vim。主要要重启电脑，要不然没用

```shell
  git config --global core.editor "D:/WorkSoft/Vim/vim91/vim.exe"
```

