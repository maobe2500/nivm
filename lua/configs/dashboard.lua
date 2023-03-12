local db = require('dashboard')



-- db.preview_command = 'cat | lolcat -F 0.3'
db.preview_command = 'cat | cat'
--- db.preview_file_path = home .. '/.config/nvim/static/ascii/biohazard.cat'
db.preview_file_height = 16
db.preview_file_width = 40


db.setup({
  theme = 'hyper',
  config = {
    week_header = {
     enable = true,
    },
    shortcut = {
      { desc = ' Update', group = '@property', action = 'Lazy update', key = 'u' },
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'Files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
      {
        desc = ' Apps',
        group = 'DiagnosticHint',
        action = 'Telescope app',
        key = 'a',
      },
      {
        desc = ' dotfiles',
        group = 'Number',
        action = 'Telescope dotfiles',
        key = 'd',
      },
    },
  },
})
