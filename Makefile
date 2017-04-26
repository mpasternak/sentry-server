clean:
	find . -name \*~ -print0 | xargs -0 rm -fv 
	find . -name \*pyc -print0 | xargs -0 rm -fv 
	find . -name \*\\.log -print0 | xargs -0 rm -fv 
	
sentry-production-host:
	ansible-playbook -i "/Volumes/Dane zaszyfrowane/IPL/ansible/hosts.cfg" ansible/provision.yml
