#!/usr/bin/env node
"use strict";
require('shelljs/global');

process.env["GIT_HTTP_PORT"] = 5555;
process.env["GIT_SHARED_REPOSITORIES_LOCATION"] = "repos"

exec(`./git-server.js`)
