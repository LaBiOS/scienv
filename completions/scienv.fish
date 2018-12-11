function __fish_scienv_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'scienv' ]
    return 0
  end
  return 1
end

function __fish_scienv_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

complete -f -c scienv -n '__fish_scienv_needs_command' -a '(scienv commands)'
for cmd in (scienv commands)
  complete -f -c scienv -n "__fish_scienv_using_command $cmd" -a "(scienv completions $cmd)"
end