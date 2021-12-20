function onCreate()
    precacheSound('knife');
    precacheImage('stages/hallwaymoving/cut');
    setupStage('hallwaymoving');
    setupStage('falling');
    showStage('hallwaymoving');
    hideStage('falling');
end

function setupStage(name)
    if name == 'hallwaymoving' then
        makeAnimatedLuaSprite('bg', 'stages/hallwaymoving/hallway', -1800, -750);
        addAnimationByPrefix('bg', 'scroll', 'bg', 24, true);

        makeAnimatedLuaSprite('cut', 'stages/hallwaymoving/cut', cameraX - 160, cameraY - 100);
        addAnimationByPrefix('cut', 'intro', 'cut', 0, false);
        addAnimationByPrefix('cut', 'cut', 'cut', 14, false);
        setLuaSpriteScrollFactor('cut', 0, 0);
        scaleObject('cut', 1.4, 1.4);

        addLuaSprite('bg', false);
        addLuaSprite('cut', true);
        objectPlayAnimation('bg', 'scroll');
    elseif name == 'falling' then
        makeLuaSprite('bgSky', 'stages/hallwaymoving/cloub', cameraX - 160, cameraY - 100);
        setLuaSpriteScrollFactor('bgSky', 0, 0);

        makeLuaSprite('bgClouds', 'stages/hallwaymoving/cloua', cameraX - 1100, cameraY - 400);
        setLuaSpriteScrollFactor('bgClouds', 0.01, 0.01);

        makeLuaSprite('bglol', 'stages/hallwaymoving/bg', cameraX - 820, cameraY - 100);
        setLuaSpriteScrollFactor('bglol', 0.01, 0.01);

        addLuaSprite('bgSky', false);
        addLuaSprite('bglol', false);
        addLuaSprite('bgClouds', false);
    end
end

function onUpdate(elapsed)
    if getProperty('bgSky.alpha') == 1 then
        setProperty('bgClouds.y', getProperty('bgClouds.y') + -0.2);
        setProperty('bglol.y', getProperty('bglol.y') - 0.01);
    end
end

function hideStage(name)
    if name == 'hallwaymoving' then
        setProperty('bg.alpha', 0);
    elseif name == 'falling' then
        setProperty('bgSky.alpha', 0);
        setProperty('bgClouds.alpha', 0);
        setProperty('bglol.alpha', 0);
    end
end

function showStage(name)
    if name == 'hallwaymoving' then
        setProperty('bg.alpha', 1);
    elseif name == 'falling' then
        setProperty('bgSky.alpha', 1);
        setProperty('bgClouds.alpha', 1);
        setProperty('bglol.alpha', 1);
    end
end

function onStepHit()
    if getProperty('curStep') == 632 then
        setProperty('cut.alpha', 1);
        cancelTween('cutFade');
        setProperty('bf.alpha', 0);
        objectPlayAnimation('cut', 'cut');
        hideStage('hallwaymoving');
        showStage('falling');
    elseif getProperty('curStep') == 640 then
        setProperty('cut.alpha', 0);
    elseif getProperty('curStep') > 640 then
        cameraShake('game', 0.005, 1);
        cameraShake('hud', 0.0005, 1);
    end
    if getProperty('curStep') == 383 then
        setProperty('cutPreload.alpha', 0);
        doTweenAlpha('cutFade', 'cut', 0, 0.2, 'linear');
    end
end