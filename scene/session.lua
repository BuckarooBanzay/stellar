local sessions = {}

function scene.is_active(session)
    return sessions[session] ~= nil
end

function scene.get_session(session)
    return sessions[session]
end

function scene.set_session(session, data)
    sessions[session] = data
end
