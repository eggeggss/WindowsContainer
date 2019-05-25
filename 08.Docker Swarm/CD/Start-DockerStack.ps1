$DockerHost=$args[0]
$DockerComposefile=$args[1]

"Docker Host :"+$DockerHost
"Docker File :"+$DockerComposefile

$RunDockerStack='docker -H '+$DockerHost+':2375 stack deploy --with-registry-auth -c '+$DockerComposefile+' <serviceName>'

"Command 1 :"+$RunDockerStack
Invoke-Expression $RunDockerStack