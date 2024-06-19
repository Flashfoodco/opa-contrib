rockspec_format = "3.0"
package = "kong-plugin-opa-contrib"
version = "0.1.1-2"
source = {
   url = "git+https://github.com/Flashfoodco/opa-contrib.git",
   branch = "kong-plugin-mods",
}
description = {
   summary = "Integrate the Open Policy Agent (OPA) with Kong API Gateway for API access management",
   detailed = [[
      see https://github.com/Flashfoodco/opa-contrib/tree/main/kong_api_authz for more information
   ]],
   homepage = "https://github.com/Flashfoodco/opa-contrib/tree/main/kong_api_authz",
   issues_url = "https://github.com/open-policy-agent/contrib/issues",
}
dependencies = {
   "lua-cjson",
   "lua-resty-http",
   "lua-resty-jwt",
   "net-url",
}
test_dependencies = {
   "luacov",
   "luacheck",
}
test = {
   type = "busted",
   flags = { "-o", "gtest" },
}
build = {
   type = "builtin",
   modules = {
      ["kong.plugins.opa-contrib.access"] = "src/kong/plugins/opa/access.lua",
      ["kong.plugins.opa-contrib.handler"] = "src/kong/plugins/opa/handler.lua",
      ["kong.plugins.opa-contrib.schema"] = "src/kong/plugins/opa/schema.lua",
      ["kong.plugins.opa-contrib.helpers"] = "src/kong/plugins/opa/helpers.lua",
   },
}
