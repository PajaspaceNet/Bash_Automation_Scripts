## FIREWALL

## jestli bezi
firewall-cmd --state 

### HTTP (aplikace)
sudo firewall-cmd --permanent --add-port=8080/tcp

### Management konzole
sudo firewall-cmd --permanent --add-port=9990/tcp

### (Volitelné) HTTPS, pokud zapneš SSL
sudo firewall-cmd --permanent --add-port=8443/tcp

### Otoceni firewallu
sudo firewall-cmd --reload

### na kterych posloucha java
 sudo ss -tulnp | grep java

