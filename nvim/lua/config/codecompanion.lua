local adapters = require("codecompanion.adapters")

require("codecompanion").setup({
    opts = {
        log_level = "DEBUG",
        system_prompt = function(opts)
            return "You are an expert programmer who provides brief explanation and great solutions."
        end,
    },

    -- model configuration for providers
    adapters = {
        ollama_local = function()
            return adapters.extend("ollama", {
                name = "ollama_local",
                schema = {
                    model = {
                        default = "qwen3:8b",
                    },
                    num_ctx = {
                        default = 16384,
                    },
                    num_predict = {
                        default = -1,
                    },
                },
            })
        end,
    },

    -- default providers to use
    strategies = {
        chat = {
            adapter = "ollama_local",
        },
        inline = {
            adapter = "ollama_local",
        },
    },

    -- default picker
    display = {
        action_palette = {
            provider = "telescope",
        },
        chat = {
            show_settings = true,
        },
    },
})
