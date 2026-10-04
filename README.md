# pi-kit-demo

视频《Pi Agent 实战：Package 的安装与开发》的示例代码。用 [Pi](https://pi.dev) 1.0.2 实测。

- `tip-calc/` - 一个小费计算器。`tip.js` 是初始版本，`tip.staged.js` 是视频里那次已暂存的改动（新增按人数平摊，没有校验人数）。
- `my-pi-kit/` - 一个自己的 Package：`/review` 提示词模板 + `commit-msg` Skill。
- `scripts/setup-demo.sh` - 重建视频里的演示状态。

## 准备

```bash
git clone https://github.com/sugarforever/pi-kit-demo.git
cd pi-kit-demo
bash scripts/setup-demo.sh ~/pi-demo
cd ~/pi-demo/tip-calc
```

升级 Pi（不带参数时升级的是 Pi 本身）：

```bash
pi update
```

## 试用一个 Package

`-e` 只在这一次运行里加载，不写进设置：

```bash
pi -e npm:@juicesharp/rpiv-todo
pi list
```

## 装进项目

```bash
pi install npm:@juicesharp/rpiv-todo -l
cat .pi/settings.json
pi list
```

`-l` 写的是项目的 `.pi/settings.json`。项目设置要先信任才会读取：运行 `pi`，在 “Trust project folder?” 里选 Trust；或者给单条命令加 `-a`，只信任这一次（如 `pi list -a`）。

## 安装自己的 Package

```bash
pi install ../my-pi-kit -l
pi list
```

相对路径从设置文件所在的位置解析，所以 `.pi/settings.json` 里写的是 `../../my-pi-kit`。

然后打开 `pi`：

```text
/review
/review 并发安全
/skill:commit-msg
```

## 管理

```bash
pi config -l                               # 按资源启用 / 停用
pi remove npm:@juicesharp/rpiv-todo -l     # 卸载
pi update --extensions                     # 更新已装的 Package
pi update --all                            # 连 Pi 本身一起更新
```

Package 可以执行代码。安装第三方 Package 之前，先看一眼它的源码。

## 参考

- [Pi Packages](https://github.com/earendil-works/pi/blob/v1.0.0/packages/coding-agent/docs/packages.md)
- [Prompt Templates](https://github.com/earendil-works/pi/blob/v1.0.0/packages/coding-agent/docs/prompt-templates.md)
- [Skills](https://github.com/earendil-works/pi/blob/v1.0.0/packages/coding-agent/docs/skills.md)
- [Pi Packages 页面](https://pi.dev/packages)
