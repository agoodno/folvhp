set :user, "lakevie"
set :application, "friends"
set :repository,  "http://agoodno.homelinux.org/svn/folvhp/trunk"
set :deploy_to, "/home/lakevie/#{application}"
set :runner, :user # set the sudo runner user to whatever the connecting user is

role :app, "lakevie@74.86.131.28"
role :web, "lakevie@74.86.131.28"
role :db, "lakevie@74.86.131.28", :primary => true

task :restart_web_server, :roles => :web do
  run "chmod -R 755 /home/lakevie/friends/current/public"
  run "killall -usr1 dispatch.fcgi"
end

after "deploy:start", :restart_web_server