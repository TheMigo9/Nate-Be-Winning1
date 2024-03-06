offsetPlayer = 30
offsetOpponent = 30
--Esta vaina lo hizo asbelin y el que se lo robe será doxeado🥺

function onCreatePost()
    if rating == 0 then
        setTextString('scoreTxt','Score: '..score..
        ' | Misses: '..misses..
        ' | Port By TheMigo | Rating: ?');
    end

    --setProperty('healthBar.x',650);
    --setProperty('scoreTxt.visible',false);

    
    -- some songs can have skipCountdown
    if getProperty('skipCountdown') == true then
        setPropertyFromGroup('opponentStrums',0,'x',defaultOpponentStrumX0 - offsetOpponent);
        setPropertyFromGroup('opponentStrums',1,'x',defaultOpponentStrumX1 - offsetOpponent);
        setPropertyFromGroup('opponentStrums',2,'x',defaultOpponentStrumX2 - offsetOpponent);
        setPropertyFromGroup('opponentStrums',3,'x',defaultOpponentStrumX3 - offsetOpponent);
        setPropertyFromGroup('playerStrums',0,'x',defaultPlayerStrumX0 + offsetPlayer);
        setPropertyFromGroup('playerStrums',1,'x',defaultPlayerStrumX1 + offsetPlayer);
        setPropertyFromGroup('playerStrums',2,'x',defaultPlayerStrumX2 + offsetPlayer);
        setPropertyFromGroup('playerStrums',3,'x',defaultPlayerStrumX3 + offsetPlayer);
    end
end

function onUpdateScore(miss)
    setTextString('scoreTxt','Score: '..score..
    ' | Misses: '..misses..
    ' | Port By Asbelin | Rating: '..ratingName..' ('..string.format("%.f%%",rating * 100) .. ' - ' ..ratingFC..')');
    if miss then
        setTextColor('scoreTxt','FF0000');
        doTweenColor('scoreTxt_color','scoreTxt','FFFFFF',0.1);
    end
end

function onCountdownTick(swagCounter)
    if swagCounter == 0 then
        noteTweenX('tween_1',0,defaultOpponentStrumX0 - offsetOpponent,crochet/1000,'circOut');
        noteTweenX('tween_8',7,defaultPlayerStrumX3 + offsetPlayer,crochet/1000,'circOut');
    end
    if swagCounter == 1 then
        noteTweenX('tween_3',1,defaultOpponentStrumX1 - offsetOpponent,crochet/1000,'circOut');
        noteTweenX('tween_7',6,defaultPlayerStrumX2 + offsetPlayer,crochet/1000,'circOut');
    end
    if swagCounter == 2 then
        noteTweenX('tween_2',2,defaultOpponentStrumX2 - offsetOpponent,crochet/1000,'circOut');
        noteTweenX('tween_6',5,defaultPlayerStrumX1 + offsetPlayer,crochet/1000,'circOut');
    end
    if swagCounter == 3 then
        noteTweenX('tween_1',3,defaultOpponentStrumX3 - offsetOpponent,crochet/1000,'circOut');
        noteTweenX('tween_5',4,defaultPlayerStrumX0 + offsetPlayer,crochet/1000,'circOut');
    end
end