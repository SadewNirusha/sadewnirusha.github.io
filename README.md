<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Let It Go \u2014 Stress Relief</title>
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,700;1,400&family=Crimson+Pro:ital,wght@0,300;0,400;1,300&display=swap" rel="stylesheet">
<style>
  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

  :root {
    --bg: #0b0e1a;
    --surface: #111528;
    --ink: #e8e2d5;
    --muted: #7a7d96;
    --accent1: #c5a97b;
    --accent2: #7b9fc5;
    --accent3: #c57ba3;
    --glow1: rgba(197,169,123,0.18);
    --glow2: rgba(123,159,197,0.18);
  }

  html, body {
    width: 100%; height: 100%;
    background: var(--bg);
    color: var(--ink);
    font-family: 'Crimson Pro', Georgia, serif;
    overflow-x: hidden;
  }

  /* \u2500\u2500 Starfield canvas \u2500\u2500 */
  #starfield {
    position: fixed; inset: 0; z-index: 0;
    pointer-events: none;
  }

  /* \u2500\u2500 Layout \u2500\u2500 */
  .scene {
    position: relative; z-index: 1;
    min-height: 100vh;
    display: flex; flex-direction: column; align-items: center;
    padding: 3rem 1.5rem 5rem;
    gap: 2.5rem;
  }

  /* \u2500\u2500 Header \u2500\u2500 */
  header {
    text-align: center;
    animation: fadeDown .9s ease both;
  }
  header h1 {
    font-family: 'Playfair Display', Georgia, serif;
    font-size: clamp(2.2rem, 6vw, 4rem);
    font-weight: 400;
    letter-spacing: .04em;
    color: var(--accent1);
    text-shadow: 0 0 40px var(--glow1);
  }
  header p {
    margin-top: .5rem;
    font-size: 1.1rem;
    font-style: italic;
    color: var(--muted);
    letter-spacing: .06em;
  }

  /* \u2500\u2500 Mode tabs \u2500\u2500 */
  .tabs {
    display: flex; gap: .6rem; flex-wrap: wrap; justify-content: center;
    animation: fadeDown .9s .15s ease both;
  }
  .tab {
    padding: .45rem 1.2rem;
    border: 1px solid #2e3350;
    border-radius: 100px;
    background: transparent;
    color: var(--muted);
    font-family: 'Crimson Pro', serif;
    font-size: .95rem;
    letter-spacing: .08em;
    cursor: pointer;
    transition: all .25s;
  }
  .tab:hover { border-color: var(--accent1); color: var(--accent1); }
  .tab.active {
    background: var(--accent1);
    border-color: var(--accent1);
    color: var(--bg);
  }

  /* \u2500\u2500 Panels \u2500\u2500 */
  .panel { display: none; width: 100%; max-width: 680px; animation: fadeUp .5s ease both; }
  .panel.visible { display: flex; flex-direction: column; align-items: center; gap: 1.6rem; }

  /* \u2500\u2500\u2500 BREATHE panel \u2500\u2500\u2500 */
  #panel-breathe { gap: 2rem; }

  .breath-guide {
    position: relative;
    width: 220px; height: 220px;
    display: flex; align-items: center; justify-content: center;
  }
  .breath-ring {
    position: absolute; inset: 0;
    border-radius: 50%;
    border: 2px solid var(--accent2);
    opacity: .3;
    animation: none;
  }
  .breath-ring.pulse {
    animation: breatheScale var(--breath-duration, 8s) ease-in-out infinite;
  }
  .breath-circle {
    width: 100px; height: 100px;
    border-radius: 50%;
    background: radial-gradient(circle at 38% 35%, var(--accent2), #1a2a45);
    box-shadow: 0 0 60px var(--glow2), 0 0 120px var(--glow2);
    transition: transform .3s;
    animation: none;
  }
  .breath-circle.pulse {
    animation: breatheScale var(--breath-duration, 8s) ease-in-out infinite;
  }
  @keyframes breatheScale {
    0%,100% { transform: scale(1); opacity: .7; }
    50%      { transform: scale(1.55); opacity: 1; }
  }
  .breath-label {
    margin-top: 1rem;
    font-size: 1.4rem;
    letter-spacing: .12em;
    color: var(--accent2);
    min-height: 2rem;
    text-align: center;
    font-style: italic;
  }
  .breath-sublabel {
    font-size: .9rem;
    color: var(--muted);
    letter-spacing: .08em;
  }

  .breath-controls { display: flex; gap: 1rem; align-items: center; }
  .btn-primary {
    padding: .6rem 2rem;
    border: 1.5px solid var(--accent2);
    border-radius: 100px;
    background: transparent;
    color: var(--accent2);
    font-family: 'Crimson Pro', serif;
    font-size: 1rem;
    letter-spacing: .1em;
    cursor: pointer;
    transition: all .25s;
  }
  .btn-primary:hover { background: var(--accent2); color: var(--bg); box-shadow: 0 0 30px var(--glow2); }
  .btn-primary.active { background: var(--accent2); color: var(--bg); }

  .pace-selector { display: flex; gap: .4rem; }
  .pace-btn {
    padding: .35rem .8rem;
    border: 1px solid #2e3350;
    border-radius: 100px;
    background: transparent;
    color: var(--muted);
    font-family: 'Crimson Pro', serif;
    font-size: .85rem;
    cursor: pointer;
    transition: all .2s;
  }
  .pace-btn:hover { border-color: var(--accent2); color: var(--accent2); }
  .pace-btn.active { border-color: var(--accent2); color: var(--accent2); }

  /* \u2500\u2500\u2500 RELEASE panel \u2500\u2500\u2500 */
  .release-wrap {
    width: 100%; display: flex; flex-direction: column; align-items: center; gap: 1rem;
  }
  .release-label {
    font-size: 1rem; color: var(--muted); letter-spacing: .08em; font-style: italic;
  }
  #release-input {
    width: 100%;
    min-height: 130px;
    background: var(--surface);
    border: 1px solid #2b2f4a;
    border-radius: 12px;
    padding: 1.2rem 1.4rem;
    color: var(--ink);
    font-family: 'Crimson Pro', serif;
    font-size: 1.15rem;
    line-height: 1.6;
    resize: none;
    outline: none;
    transition: border-color .25s;
  }
  #release-input:focus { border-color: var(--accent3); }
  #release-input::placeholder { color: #3a3d58; }

  .release-actions { display: flex; gap: 1rem; flex-wrap: wrap; justify-content: center; }

  .btn-burn {
    padding: .6rem 1.8rem;
    border: 1.5px solid var(--accent3);
    border-radius: 100px;
    background: transparent;
    color: var(--accent3);
    font-family: 'Crimson Pro', serif;
    font-size: 1rem;
    letter-spacing: .1em;
    cursor: pointer;
    transition: all .25s;
  }
  .btn-burn:hover { background: var(--accent3); color: var(--bg); box-shadow: 0 0 30px rgba(197,123,163,.3); }

  .btn-dissolve {
    padding: .6rem 1.8rem;
    border: 1.5px solid var(--accent1);
    border-radius: 100px;
    background: transparent;
    color: var(--accent1);
    font-family: 'Crimson Pro', serif;
    font-size: 1rem;
    letter-spacing: .1em;
    cursor: pointer;
    transition: all .25s;
  }
  .btn-dissolve:hover { background: var(--accent1); color: var(--bg); box-shadow: 0 0 30px var(--glow1); }

  /* fire overlay */
  #fire-overlay {
    position: fixed; inset: 0; z-index: 999;
    display: flex; align-items: center; justify-content: center;
    background: rgba(10,8,5,.92);
    opacity: 0; pointer-events: none;
    transition: opacity .4s;
  }
  #fire-overlay.show { opacity: 1; pointer-events: all; }
  #fire-canvas { border-radius: 12px; }
  .fire-message {
    position: absolute; bottom: 15%; left: 50%; transform: translateX(-50%);
    font-family: 'Playfair Display', serif;
    font-size: 1.4rem;
    color: var(--accent1);
    text-align: center;
    opacity: 0;
    transition: opacity .5s .4s;
    text-shadow: 0 0 20px var(--glow1);
    letter-spacing: .06em;
  }
  #fire-overlay.show .fire-message { opacity: 1; }

  /* dissolve overlay */
  #dissolve-overlay {
    position: fixed; inset: 0; z-index: 999;
    display: flex; align-items: center; justify-content: center;
    background: rgba(8,10,22,.95);
    opacity: 0; pointer-events: none;
    transition: opacity .5s;
  }
  #dissolve-overlay.show { opacity: 1; pointer-events: all; }
  .dissolve-text {
    font-family: 'Playfair Display', serif;
    font-size: clamp(1.2rem, 4vw, 2rem);
    color: var(--ink);
    text-align: center;
    max-width: 520px;
    padding: 2rem;
    line-height: 1.6;
    transition: opacity 3s, filter 3s, transform 3s;
  }
  .dissolve-text.gone {
    opacity: 0; filter: blur(18px); transform: scale(1.12) translateY(-20px);
  }
  .dissolve-after {
    position: absolute; bottom: 20%; left: 50%; transform: translateX(-50%);
    font-family: 'Playfair Display', serif;
    font-style: italic;
    color: var(--accent2);
    font-size: 1.15rem;
    opacity: 0; transition: opacity .6s;
    text-align: center;
    white-space: nowrap;
  }
  #dissolve-overlay.show .dissolve-after.visible { opacity: 1; }

  /* \u2500\u2500\u2500 SHAKE panel \u2500\u2500\u2500 */
  #panel-shake { gap: 1.4rem; align-items: center; }
  .shake-desc { font-size: 1rem; color: var(--muted); font-style: italic; text-align: center; }

  .shaker-wrap {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: .7rem;
    width: 100%;
  }
  .bubble {
    aspect-ratio: 1;
    border-radius: 50%;
    background: radial-gradient(circle at 35% 32%, var(--c2), var(--c1));
    cursor: pointer;
    display: flex; align-items: center; justify-content: center;
    font-size: 1.6rem;
    transition: transform .12s, box-shadow .12s;
    user-select: none;
    -webkit-tap-highlight-color: transparent;
  }
  .bubble:hover { transform: scale(1.08); }
  .bubble:active { transform: scale(.92); }
  .bubble.pop {
    animation: popBubble .35s ease forwards;
  }
  @keyframes popBubble {
    0%