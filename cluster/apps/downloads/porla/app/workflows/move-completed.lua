local Workflow          = require "porla.Workflow"
local TorrentFinished   = require "porla.triggers.TorrentFinished"
local TorrentFlags      = require "porla.actions.TorrentFlags"
local TorrentMove       = require "porla.actions.TorrentMove"

return Workflow:new{
    on = TorrentFinished:new{},
    actions = {
        TorrentFlags:new{
            unset = {
                "auto_managed"
            }
        },
        TorrentMove:new{
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
        }
    }
}