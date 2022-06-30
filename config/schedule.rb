ENV.each { |k, v| env(k, v) } # 環境変数をwheneverにいい感じに書き込んでもらう
set :output, error: 'log/crontab_error.log', standard: 'log/crontab.log' # ログを書き出すようにしておくとデバッグが楽
set :environment, :development

every 1.minutes do
  rake "rss:feeds"
end