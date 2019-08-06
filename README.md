# vim-template #

Vim-template provides a way of using [UltiSnips](https://github.com/SirVer/ultisnips) to create dynamic templates for new files.

## Usage ##

### Using the `_skel` template ###

Whenever a new buffer is created, the plugin will try and expand the snippet `_skel` for that filetype. A simple use case would be a shell script starting with a `shebang`:

```snippets
snippet _skel "Shebang" b
#!/bin/sh
$0
endsnippet
```

After saving that new snippet, whenever an empty `sh` buffer is opened, vim will populate it with our template.

### Using [`vim-projectionist`](https://github.com/tpope/vim-projectionist) to determine the template ###

Vim-projectionist is a great way of providing meta data to your project. It allows for the file `.projections.json` to be read by vim, adding information about certain files in the current directory subtree.

We can here be even more specific with our templates.

```json
.projections.json
{
    "tests/test_*.py": {
        "skeleton": "unittest"
    }
}
```

Where the snippets file for `python` contains:

```
snippet _unittest "Unittest template" b
import unittest
import `!p snip.rv = fn[5:-3]`

class Test`!p snip.rv = fn[5:-3].title()`(unittest.TestCase):
	@classmethod
	def setUpClass(cls):
		${1:pass}

	def test_${2:function}(self):
		${3:pass}

if __name__ == '__main__':
	unittest.main()
endsnippet
```

If the template should be the same for all projects, you can use `g:projectionist_heuristics` to define a global setting.

```vim
let g:projectionist_heuristics = {
      \   '*': {
      \     'tests/test_*.py': {
      \       'skeleton': 'unittest'
      \     },
      \   },
      \ }
```

Resulting in:

![vim-template](https://media.giphy.com/media/h5XHFzXWFe4JxibGwM/giphy.gif "vim-template")

## Installation ##

Install using your favorite package manager, or use Vim's built-in package
support:

```shell
$ mkdir -p ~/.vim/pack/manager/start
$ cd ~/.vim/pack/manager/start
$ git clone https://github.com/srydell/vim-template.git
$ vim -u NONE -c "helptags vim-template/doc" -c q
```

## License ##
**NOTE:** This plugin started as a simple copy paste from [an idea by Noah Frederick](https://noahfrederick.com/log/vim-templates-with-ultisnips-and-projectionist) and is used and distributed with his approval. Check out some of his projects on [his github](https://github.com/noahfrederick) or [his website](https://noahfrederick.com).

Otherwise distributed under the same terms as Vim itself. See `:help license.`
