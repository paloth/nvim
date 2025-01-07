local filetypes = {}

function filetypes.init()
  vim.filetype.add {
    extension = {
      tf = 'terraform',
      tfvars = 'terraform-vars',
    },
  }
end

return filetypes
