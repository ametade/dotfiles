from __future__ import with_statement
from fabric.api import * 

# Use this then the server cannot make outside connections

def deploy():
    with lcd("../vim"):
        local('tar czf /tmp/vim.tar.gz vimrc autoload backup bundle syntax tmp')
        put('/tmp/vim.tar.gz', '/tmp')

    with cd('~/.vim'):
        run('tar xzf /tmp/vim.tar.gz')
        run('sh bootstrap.sh')


