# sudo service elasticsearch start
# sudo service elasticsearch status
# sudo systemctl start logstash.service
# sudo systemctl status logstash.service
#
# sudo /usr/share/logstash/bin/logstash -e 'input { stdin { } } output { stdout {} }'
# Ctrl D to end
sudo service elasticsearch start; \
sudo systemctl start logstash.service \
~vmadmin/kibana-7.4.2-linux-x86_64/bin/kibana
 2187  git add --all && git commit -m "commit message"
 2189  git push
