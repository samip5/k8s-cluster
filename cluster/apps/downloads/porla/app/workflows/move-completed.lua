local torrents  = require("torrents")
local workflows = require("workflows")
local torrent   = require("workflows.actions.torrent")
local finished  = require("workflows.triggers.torrent").finished

function porla.init()
    workflows.add({
        on = finished(),
        actions = {
            function(ctx, callback)
                local props = torrents.properties.get(ctx.torrent)
                props.flags = props.flags & ~torrents.flags.auto_managed
                torrents.properties.set(ctx.torrent, props)

                callback()
            end,
            torrent.move({
                path = function(ctx)
                    local category = ctx.torrent.category or "default"
                    if(category == "movies") then
                        return "/media/downloads/porla/Movies"
                    elseif(category == "sonarr") then
                        return "/media/downloads/porla/Sonarr"
                    elseif(category == "radarr") then
                        return "/media/downloads/porla/Radarr"
                    elseif(category == "default") then
                        return "/media/downloads/porla/"
                    elseif(ctx.torrent.save_path == "/media/downloads/porla/") then
                        return "/media/downloads/porla/"..category
                    end
                end
            })
        }
    })
end