*Crear KVM*

`En el Nodo PX01 existe una KVM que se llama `ansible-origins` no tiene IP
Solo es un template que usa ansible para clonar y a partir del clon se instala lo demas.`
```
ansible-playbook kvm-proxmox.yml --limit nodo
```
`Y se ejecutan los comandos igual que en el CT.`





*Crear  Containers*

```
El template:  Ubuntu-16.04-ansible.tar.gz ya tiene preinstalado Python y VIM, junto con la config para el interfaces.
Solo es necesario:

1- Entrar al server 
2- Asignar la ip y reiniciar el networking
3- Ejecutar el Playbook con user root passwd y ya :p
4- Disfrutar
```

`Crear CT de Proxmox`
```
ansible-playbook  ct-proxmox.yaml --limit nodo
```

`Instalar  LEMP-stack`
```
ansible-playbook main-lemp.yaml --user root --ask-pass
``` 

`Instalar JAVA-stack`
```
ansible-playbook main-java.yaml --user root --ask-pass
``` 

`Instalar POSTGRES-stack`
```
ansible-playbook playbooks/postgres.yaml --user root --ask-pass
``` 

`Instalar MYSQL-stack`
```
ansible-playbook playbooks/mysql.yaml --user root --ask-pass
``` 

`Instalar REDIS-stack`
```
ansible-playbook playbooks/redis.yaml --user root --ask-pass
```



`Agregar llaves de Sysadmins DBA's y Devs`
```
ansible-playbook  playbooks/sysadmin-keys.yaml --user root --ask-pass
ansible-playbook  playbooks/devs-keys.yaml --user root --ask-pass
ansible-playbook  playbooks/dba.yaml --user root --ask-pass

```
