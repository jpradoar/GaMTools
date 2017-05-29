# Vagrant 01

- Explicación básica de archivo de configuración  Vagrantfile

<pre>
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Sistema Operativo
  # https://atlas.hashicorp.com/boxes/search?utm_source=vagrantcloud.com&vagrantcloud=1
  config.vm.box = "ubuntu/trusty64"
  #
  # 
  # Forwardeo de puertos,  
  # 80 => puerto de la virtual de vagrant
  # 8088 => el puerto en mi maquina host (mi notebook por ejemplo  http://localhost:8088)
  # protocol => el tipo de protocolo usado  TCP o UDP, si quisieramos ambos podriamos duplicar la linea y solo cambiar tcp por udp
  # auto_correct: true  =>  Vagrant corrige cualquier tipo de colicion y manda un mensaje
  config.vm.network "forwarded_port", guest: 80, host: 8088,  protocol: "tcp", auto_correct: "true"
  #
  #
  # Configurar una red privada con ip fija
  # De esta manera podria acceder a mi nueva vm de la siguiente manera:
  # opcion1:   http://127.0.0.1:8088
  # Opcion2:   http://99.99.99.100
  config.vm.network "private_network", ip: "99.99.99.100"
  #
  #
  # Creo un directorio en mi equipo personal y lo mapeo con un directorio en la VM
  # /home/jprado/vagrant_public : mi directorio local en mi notebook
  # /var/www/html : directorio en la maquina virtual recien creada
  config.vm.synced_folder "/home/jprado/vagrant_public", "/var/www/html"  
  #
  #
  # Script para instalar y provisionar:  bootstrap.sh
  config.vm.provision "shell", path: "bootstrap.sh"
  #
  #
  # Configuro el hardware de la VM
  config.vm.provider :virtualbox do |virtualbox|
    #
    # Nombre de la máquina virtual de virtualbox
    virtualbox.name = 'TestMV02'
    #
    # Memoria
    virtualbox.memory = 512
    #
    # Número de procesadores
    virtualbox.cpus = 1
    end # end del config
end # end general
# ssh login  => vagrant:vagrant 
</pre>
