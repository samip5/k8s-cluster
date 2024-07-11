local workflows = require("workflows")
local log       = require("workflows.actions.log")
local torrent   = require("workflows.actions.torrent")
local cron      = require("workflows.triggers.cron")

function porla.init()
    workflows.add({
        on = cron("0 1-59/5 * * * *"),
        filter = function(ctx)
            if ctx.torrent.category == "sonarr" and (ctx.torrent.is_seeding or ctx.torrent.is_finished) then
                local time = ctx.torrent.seeding_duration
                local ratio = ctx.torrent.ratio
                if ctx.torrent.tags:find("private") then
                    -- 1 Hour
                    if time >= 3600 and ratio >= 4 then
                        return true
                        -- 6 Hours
                    elseif time >= 21600 and ratio >= 3 then
                        return true
                        -- 12 Hours
                    elseif time >= 43200 and ratio >= 2 then
                        return true
                        -- 24 Hours
                    elseif time >= 86400 and ratio >= 1.1 then
                        return true
                        -- 8 Days 1 Hour
                    elseif time >= 694800 then
                        return true
                    end
                elseif ctx.torrent.tags:find("public") then
                    return time >= 1800
                else
                    return ratio >= 1.01 or time >= 694800
                end
            end
        end,
        actions = {
            log(function(ctx)
                return string.format("Torrent Finished/Done: %s. Ratio: %.2f. Seeding Time: %sm", ctx.torrent.name, ctx.torrent.ratio, tostring(ctx.torrent.seeding_duration/60))
            end),
            torrent.remove({
                remove_files = true
            })
        }
    })
end