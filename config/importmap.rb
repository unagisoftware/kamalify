# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "highlight-js", to: "https://ga.jspm.io/npm:highlight.js@11.11.1/lib/core.js"
pin "highlight-yaml", to: "https://ga.jspm.io/npm:highlight.js@11.11.1/lib/languages/yaml.js"
