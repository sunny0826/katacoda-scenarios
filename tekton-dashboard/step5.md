本节中，我们将通过查看 PipelineRun 日志来监控其进度。部署成功后，将打开 MyApp，查看部署效果。

## 查看 PipelineRun 日志

点击页面顶部创建通知中的链接，查看MyApp PipelineRun 的日志。

![PipelineRun creation notification screenshot.](https://raw.githubusercontent.com/ncskier/katacoda/master/tekton-dashboard/images/pipeline-run-created-notification.png)

或在 PipelineRun 列表中选择 PipelineRun。

![View the running PipelineRun logs for MyApp screenshot.](https://raw.githubusercontent.com/ncskier/katacoda/master/tekton-dashboard/images/pipeline-run-running.png)

确定 `build` 和 `deploy` 任务均已成功。

![View the completed PipelineRun logs for MyApp screenshot.](https://raw.githubusercontent.com/ncskier/katacoda/master/tekton-dashboard/images/pipeline-run-completed.png)

## 打开 MyApp

MyApp 将会运行在 `3000` 端口，点击如下链接查看：
https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com/

![View MyApp screenshot.](https://raw.githubusercontent.com/ncskier/katacoda/master/tekton-dashboard/images/view-myapp.png)