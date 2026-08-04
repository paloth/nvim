local filetypes = {}

-- A YAML file counts as a Helm template when it lives in a `templates/`
-- directory whose direct parent holds a Chart.yaml.
local function is_helm_template(path)
  local dir = vim.fn.fnamemodify(path, ':h')
  if vim.fn.fnamemodify(dir, ':t') ~= 'templates' then
    return false
  end
  return vim.fn.filereadable(vim.fn.fnamemodify(dir, ':h') .. '/Chart.yaml') == 1
end

function filetypes.init()
  vim.filetype.add {
    extension = {
      tf = 'terraform',
      tfvars = 'terraform-vars',
      -- Resolved per file so plain YAML keeps its own filetype.
      yaml = function(path)
        return is_helm_template(path) and 'helm' or 'yaml'
      end,
      yml = function(path)
        return is_helm_template(path) and 'helm' or 'yaml'
      end,
    },
  }
end

return filetypes
