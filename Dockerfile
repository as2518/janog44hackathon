FROM benthomasson/ansible-jupyter-kernel
 
USER root
RUN yum install -y git ansible nmap  net-snmp-utils wget
RUN pip install runipy textfsm jmespath pandas pysnmp==4.4.1
RUN wget https://github.com/ansible/ansible/raw/22cbee18da353907ccc75172bc4fefd3224197fb/lib/ansible/plugins/inventory/nmap.py
RUN cat nmap.py | sed s/cmd\ \=\ .self\._nmap./cmd\ \=\ [self\._nmap,\ "'-p 161'"]/ > nmap_tmp.py
RUN cp nmap_tmp.py /usr/lib/python2.7/site-packages/ansible/plugins/inventory/nmap.py
USER notebook
git clone https://github.com/networktocode/ntc-templates.git
