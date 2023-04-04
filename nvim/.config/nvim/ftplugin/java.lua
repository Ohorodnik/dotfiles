local root_markers = {'gradlew', '.git'}
local root_dir = require('jdtls.setup').find_root(root_markers)
local home = os.getenv('HOME')
local jdtls_dir = home .. "/.local/share/nvim/mason/packages/jdtls"
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
local config = {
  cmd = {
    home .. "/.sdkman/candidates/java/17.0.6-amzn/bin/java", -- or '/path/to/java17_or_newer/bin/java'

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-javaagent:' .. jdtls_dir .. '/lombok.jar',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    '-jar', jdtls_dir .. '/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',

    '-configuration', jdtls_dir .. '/config_linux',

    '-data', workspace_folder
  },

  root_dir = root_dir,

  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      home = home .. "/.sdkman/candidates/java/17.0.6-amzn",
      signatureHelp = { enabled = true };
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        runtimes = {
          {
            name = "JavaSE-11",
            path = home .. "/.sdkman/candidates/java/11.0.18-amzn",
          },
          {
            name = "JavaSE-17",
            path = home .. "/.sdkman/candidates/java/17.0.6-amzn",
          },
        }
      },
    sources = {
      organizeImports = {
        starThreshold = 9999;
        staticStarThreshold = 9999;
      },
    },
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
      },
      useBlocks = true,
    },
  },
},

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {}
  },
}

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
