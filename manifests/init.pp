class sassc::install {
    file { '/tmp/install-sassc.sh':
        ensure => file,
        source => 'puppet:///modules/sassc/install-sassc.sh',
        group => vagrant,
        owner => vagrant,
        mode => 777,
    }

    notify { 'SASSC script has been installed successfully' : 
            require => File['/tmp/install-sassc.sh']
    }

    exec { 'install-sassc-sh':
        command => '/tmp/install-sassc.sh',
        require => File['/tmp/install-sassc.sh'],
        provider => 'shell',
        unless => '/bin/ls -a /usr/bin/* | /bin/grep -c sassc',
    }

    file { '/usr/bin/sassc':
        ensure => link,
        target => '/home/vagrant/sassc/bin/sassc',
        require => Exec['install-sassc-sh']
    }

    notify { 'SASSC added to path' : 
	require => File['/usr/bin/sassc']
    }

}

class sassc::configure {
}

class sassc {
    include sassc::install
    include sassc::configure
}