require("lspconfig").jdtls.setup({
  cmd = { "/home/erics/.local/share/nvim/mason/bin/jdtls" },
  root_dir = require("lspconfig").util.root_pattern("pom.xml", "build.gradle", ".git") or vim.fn.getcwd(),
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-17", -- Match your JDK version
            path = "/usr/lib/jvm/java-17-openjdk-amd64", -- Replace with your JDK path
          },
        },
      },
    },
  },
})
