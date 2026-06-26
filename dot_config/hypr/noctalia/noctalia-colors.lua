local primary = "rgb(b4befe)"
local surface = "rgb(1e1e2e)"
local secondary = "rgb(f5bde6)"
local error = "rgb(f38ba8)"

hl.config({
    general = {
        col = {
            active_border = primary,
            inactive_border = surface,
        },
    },

    group = {
        col = {
            border_active = secondary,
            border_inactive = surface,
            border_locked_active = error,
            border_locked_inactive = surface,
        },

        groupbar = {
            col = {
                active = secondary,
                inactive = surface,
                locked_active = error,
                locked_inactive = surface,
            },
        },
    },
})
