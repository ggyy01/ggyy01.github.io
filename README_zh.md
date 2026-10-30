# 个人主页（三语版）

> 日常更新请看 [更新说明.md](更新说明.md)。

基于 [luost26/academic-homepage](https://github.com/luost26/academic-homepage)（MIT）修改，支持 English / 中文 / 日本語。

## 本地构建

```bash
./serve.sh          # 本地预览 http://127.0.0.1:4000 （修改后自动刷新；_config.yml 改动需重启）
./serve.sh build    # 只构建，输出到 _site/
```

## 三语结构

| 语言 | 首页 | 论文 | 项目与活动 |
|---|---|---|---|
| English | `/` | `/publications/` | `/activities/` |
| 中文 | `/zh/` | `/zh/publications/` | `/zh/activities/` |
| 日本語 | `/ja/` | `/ja/publications/` | `/ja/activities/` |

- 页面文件（`index.html`、`zh/index.html`…）只有 front matter：`lang` 与 `page_key`，布局在 `_layouts/` 中三语共用。
- 界面文字（导航、标题等）：`_data/i18n.yml`
- 每种语言的内容：`_data/<en|zh|ja>/profile.yml`（姓名、简介、教育、经历、奖项）、`news.yml`、`activities.yml`
- 三语共用：`_data/contact.yml`（邮箱、GitHub、Scholar、照片、简历 PDF）、`_data/authors.yml`、`_publications/*.md`（论文；`abstract_zh` / `abstract_ja` 可选覆盖）
- 顶部右侧 `EN / 中 / 日` 切换器会跳到同一页面的其他语言版本。

## TODO（以下内容未公开显示，补充后自动出现）

- [ ] **工作经历**：Python 后端工程师的公司名与起止年月 → `_data/{en,zh,ja}/profile.yml` 的 `experience`（取消注释）。
- [ ] **CV PDF**：放到 `assets/files/`，在 `_data/contact.yml` 的 `cv` 下填写路径；填写后导航栏和个人卡片会出现 CV 按钮。
- [x] 已使用长期邮箱。
- [x] 毕业时间已更新为 2027-03（预计）
- [ ] **论文补充（可选）**：每篇一句话 TL;DR（`abstract`，可加 `abstract_zh` / `abstract_ja`）、代表图（`cover`，建议 3:2）、arXiv / PDF / 代码 / 项目页链接（`links`）。目前只放了 DOI 和用户提供的 GitHub 资源链接。
- [ ] **CVM 综述**：正式出版后补 DOI、卷期页码，并去掉 “accepted, to appear”。
- [ ] **ICETCI / ISCAS 会议全称**（可选）：目前按提供的缩写显示。
- [ ] **项目（Projects）**：暂无素材，`_data/<lang>/activities.yml` 的 `projects` 为空时不显示。
- [ ] **其他社交/学术 ID（可选）**：ORCID、researchmap、LinkedIn → `_data/contact.yml`。
- [ ] **合作者主页链接（可选）**：在 `_data/authors.yml` 为合作者添加 `url`。
- [ ] **正式域名**：部署时填写 `_config.yml` 的 `url`。

查找源码中残留的占位符：

```bash
grep -rn "【待填写\|【TBD\|【要記入\|【要追加" _data _publications
```

## 隐私

网站只公开：姓名（含日文假名读音）、学校与学位、研究简介、论文、奖项/专利、技能、学术服务、学校邮箱、GitHub、Google Scholar 和证件照（已裁成方形并压缩，去除了 EXIF）。电话、住址、生日、性别、推荐人等**不要**写进网站。

## 部署（以后需要时）

推送到名为 `<github用户名>.github.io` 的仓库并在 Settings → Pages 启用即可；`_config.yml` 中 `baseurl` 保持为空，`url` 填正式域名。
