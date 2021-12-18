function opponentNoteHit()
triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
health = getProperty('health')
setProperty('health', health- 0.005);	
end

function onUpdate(elapsed)
	if curStep == 20 then
		started = true
	end
songPos = getSongPosition()
local currentBeat = (songPos/5000)*(curBpm/60)
doTweenY('opponentmove', 'dad', 100 - 400*math.sin((currentBeat+12*12)*math.pi), 2)
doTweenX('disruptor2', 'disruptor2.scale', 0 - 50*math.sin((currentBeat+1*0.1)*math.pi), 6)
doTweenY('disruptor2', 'disruptor2.scale', 0 - 31*math.sin((currentBeat+1*1)*math.pi), 6)
	if started == true then
		noteTweenY('player1', 4, defaultPlayerStrumY3 - 300*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenY('player2', 5, defaultPlayerStrumY1 + 300*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenY('player3', 6, defaultPlayerStrumY0 - 300*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenY('player4', 7, defaultPlayerStrumY2 +	300*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenY('opponent1', 0, defaultOpponentStrumY3 + 300*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenY('opponent2', 1, defaultOpponentStrumY1 - 300*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenY('opponent3', 2, defaultOpponentStrumY0 + 300*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenY('opponent4', 3, defaultOpponentStrumY2 - 300*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenX('playerx1', 4, defaultPlayerStrumX0 + 600*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenX('playerx2', 5, defaultPlayerStrumX1 - 600*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenX('playerx3', 6, defaultPlayerStrumX2 + 600*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenX('playerx4', 7, defaultPlayerStrumX3 - 600*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenX('opponentx1', 0, defaultOpponentStrumX0 - 600*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenX('opponentx2', 1, defaultOpponentStrumX1 + 600*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenX('opponentx3', 2, defaultOpponentStrumX2 - 600*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenX('opponentx4', 3, defaultOpponentStrumX3 + 600*math.sin((currentBeat+8*0.1)*math.pi), 3)
	end
end
