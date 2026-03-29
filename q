<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Let It Go - Stress Relief</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,700;1,400&family=Lato:wght@300;400&display=swap">
<style>
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

:root {
  --bg: #0b0e1a;
  --surface: #111528;
  --ink: #e8e2d5;
  --muted: #7a7d96;
  --accent1: #c5a97b;
  --accent2: #7b9fc5;
  --accent3: #c57ba3;
}

html, body {
  width: 100%;
  min-height: 100%;
  background-color: #0b0e1a;
  color: #e8e2d5;
  font-family: 'Lato', Arial, sans-serif;
  font-weight: 300;
  overflow-x: hidden;
}

canvas#starfield {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 0;
  pointer-events: none;
}

.scene {
  position: relative;
  z-index: 1;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 3rem 1.5rem 5rem;
  gap: 2rem;
}

/* HEADER */
header {
  text-align: center;
}
header h1 {
  font-family: 'Playfair Display', Georgia, serif;
  font-size: 3rem;
  font-weight: 400;
  letter-spacing: 0.04em;
  color: #c5a97b;
}
header p {
  margin-top: 0.4rem;
  font-size: 1rem;
  font-style: italic;
  color: #7a7d96;
  letter-spacing: 0.06em;
}

/* TABS */
.tabs {
  display: flex;
  gap: 0.5rem;
  flex-wrap: wrap;
  justify-content: center;
}
.tab {
  padding: 0.4rem 1.1rem;
  border: 1px solid #2e3350;
  border-radius: 100px;
  background: transparent;
  color: #7a7d96;
  font-family: 'Lato', Arial, sans-serif;
  font-size: 0.9rem;
  letter-spacing: 0.07em;
  cursor: pointer;
  transition: all 0.25s;
}
.tab:hover {
  border-color: #c5a97b;
  color: #c5a97b;
}
.tab.active {
  background-color: #c5a97b;
  border-color: #c5a97b;
  color: #0b0e1a;
}

/* PANELS */
.panel {
  display: none;
  width: 100%;
  max-width: 660px;
  flex-direction: column;
  align-items: center;
  gap: 1.5rem;
}
.panel.visible {
  display: flex;
}

/* ===== BREATHE ===== */
.breath-guide {
  position: relative;
  width: 220px;
  height: 220px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.breath-ring {
  position: absolute;
  top: 0; left: 0;
  width: 100%; height: 100%;
  border-radius: 50%;
  border: 2px solid #7b9fc5;
  opacity: 0.3;
}
.breath-ring.pulse {
  animation: breatheScale 8s ease-in-out infinite;
}
.breath-circle {
  width: 100px;
  height: 100px;
  border-radius: 50%;
  background: radial-gradient(circle at 38% 35%, #7b9fc5, #1a2a45);
  box-shadow: 0 0 60px rgba(123,159,197,0.3);
}
.breath-circle.pulse {
  animation: breatheScale 8s ease-in-out infinite;
}
.breath-ring.pace4, .breath-circle.pace4 { animation-duration: 8s; }
.breath-ring.pace6, .breath-circle.pace6 { animation-duration: 12s; }
.breath-ring.pace8, .breath-circle.pace8 { animation-duration: 16s; }

@keyframes breatheScale {
  0%, 100% { transform: scale(1); opacity: 0.7; }
  50%       { transform: scale(1.55); opacity: 1; }
}

.breath-label {
  margin-top: 0.8rem;
  font-size: 1.3rem;
  letter-spacing: 0.12em;
  color: #7b9fc5;
  min-height: 2rem;
  text-align: center;
  font-style: italic;
}
.breath-sublabel {
  font-size: 0.85rem;
  color: #7a7d96;
  letter-spacing: 0.07em;
  text-align: center;
}
.breath-controls {
  display: flex;
  gap: 1rem;
  align-items: center;
  flex-wrap: wrap;
  justify-content: center;
}
.btn-blue {
  padding: 0.55rem 1.8rem;
  border: 1.5px solid #7b9fc5;
  border-radius: 100px;
  background: transparent;
  color: #7b9fc5;
  font-family: 'Lato', Arial, sans-serif;
  font-size: 0.95rem;
  letter-spacing: 0.08em;
  cursor: pointer;
  transition: all 0.25s;
}
.btn-blue:hover, .btn-blue.active {
  background-color: #7b9fc5;
  color: #0b0e1a;
}
.pace-selector {
  display: flex;
  gap: 0.35rem;
}
.pace-btn {
  padding: 0.3rem 0.75rem;
  border: 1px solid #2e3350;
  border-radius: 100px;
  background: transparent;
  color: #7a7d96;
  font-family: 'Lato', Arial, sans-serif;
  font-size: 0.8rem;
  cursor: pointer;
  transition: all 0.2s;
}
.pace-btn:hover, .pace-btn.active {
  border-color: #7b9fc5;
  color: #7b9fc5;
}

/* ===== RELEASE ===== */
.release-label {
  font-size: 0.95rem;
  color: #7a7d96;
  font-style: italic;
  text-align: center;
}
#release-input {
  width: 100%;
  min-height: 130px;
  background-color: #111528;
  border: 1px solid #2b2f4a;
  border-radius: 12px;
  padding: 1.1rem 1.3rem;
  color: #e8e2d5;
  font-family: 'Lato', Arial, sans-serif;
  font-size: 1rem;
  line-height: 1.6;
  resize: none;
  outline: none;
  transition: border-color 0.25s;
}
#release-input:focus {
  border-color: #c57ba3;
}
.release-actions {
  display: flex;
  gap: 0.9rem;
  flex-wrap: wrap;
  justify-content: center;
}
.btn-pink {
  padding: 0.55rem 1.6rem;
  border: 1.5px solid #c57ba3;
  border-radius: 100px;
  background: transparent;
  color: #c57ba3;
  font-family: 'Lato', Arial, sans-serif;
  font-size: 0.95rem;
  cursor: pointer;
  transition: all 0.25s;
}
.btn-pink:hover {
  background-color: #c57ba3;
  color: #0b0e1a;
}
.btn-gold {
  padding: 0.55rem 1.6rem;
  border: 1.5px solid #c5a97b;
  border-radius: 100px;
  background: transparent;
  color: #c5a97b;
  font-family: 'Lato', Arial, sans-serif;
  font-size: 0.95rem;
  cursor: pointer;
  transition: all 0.25s;
}
.btn-gold:hover {
  background-color: #c5a97b;
  color: #0b0e1a;
}

/* Fire overlay */
#fire-overlay {
  position: fixed;
  top: 0; left: 0;
  width: 100%; height: 100%;
  z-index: 999;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background-color: rgba(10,8,5,0.93);
  opacity: 0;
  pointer-events: none;
  transition: opacity 0.4s;
  gap: 1.5rem;
}
#fire-overlay.show {
  opacity: 1;
  pointer-events: all;
}
#fire-canvas {
  border-radius: 12px;
  display: block;
}
.fire-message {
  font-family: 'Playfair Display', Georgia, serif;
  font-size: 1.3rem;
  color: #c5a97b;
  text-align: center;
  letter-spacing: 0.06em;
  font-style: italic;
}
.overlay-close {
  padding: 0.4rem 1.2rem;
  border: 1px solid #3a3d58;
  border-radius: 100px;
  background: transparent;
  color: #7a7d96;
  font-family: 'Lato', Arial, sans-serif;
  font-size: 0.8rem;
  cursor: pointer;
  transition: all 0.2s;
}
.overlay-close:hover {
  border-color: #7a7d96;
  color: #e8e2d5;
}

/* Dissolve overlay */
#dissolve-overlay {
  position: fixed;
  top: 0; left: 0;
  width: 100%; height: 100%;
  z-index: 999;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background-color: rgba(8,10,22,0.95);
  opacity: 0;
  pointer-events: none;
  transition: opacity 0.5s;
  gap: 2rem;
  padding: 2rem;
}
#dissolve-overlay.show {
  opacity: 1;
  pointer-events: all;
}
#dissolve-words {
  font-family: 'Playfair Display', Georgia, serif;
  font-size: 1.6rem;
  color: #e8e2d5;
  text-align: center;
  max-width: 500px;
  line-height: 1.6;
  transition: opacity 3s, filter 3s, transform 3s;
}
#dissolve-words.gone {
  opacity: 0;
  filter: blur(16px);
  transform: scale(1.1) translateY(-18px);
}
#dissolve-after {
  font-family: 'Playfair Display', Georgia, serif;
  font-style: italic;
  color: #7b9fc5;
  font-size: 1.1rem;
  opacity: 0;
  transition: opacity 0.6s;
}
#dissolve-after.visible {
  opacity: 1;
}

/* ===== POP IT ===== */
.shake-desc {
  font-size: 0.95rem;
  color: #7a7d96;
  font-style: italic;
  text-align: center;
}
.score-bar {
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0.6rem 1rem;
  background-color: #111528;
  border-radius: 10px;
  border: 1px solid #1e2238;
}
.score-num {
  font-family: 'Playfair Display', Georgia, serif;
  font-size: 2rem;
  color: #c5a97b;
}
.score-label {
  font-size: 0.8rem;
  color: #7a7d96;
  font-style: italic;
}
#refill-btn {
  padding: 0.4rem 1.2rem;
  border: 1px solid #c5a97b;
  border-radius: 100px;
  background: transparent;
  color: #c5a97b;
  font-family: 'Lato', Arial, sans-serif;
  font-size: 0.85rem;
  cursor: pointer;
  transition: all 0.22s;
}
#refill-btn:hover {
  background-color: #c5a97b;
  color: #0b0e1a;
}
.bubble-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 0.7rem;
  width: 100%;
}
.bubble {
  aspect-ratio: 1 / 1;
  border-radius: 50%;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.5rem;
  transition: transform 0.12s;
  user-select: none;
  border: 2px solid rgba(255,255,255,0.1);
}
.bubble:hover { transform: scale(1.08); }
.bubble:active { transform: scale(0.92); }
.bubble.pop {
  animation: popBubble 0.35s ease forwards;
}
@keyframes popBubble {
  0%   { transform: scale(1); opacity: 1; }
  40%  { transform: scale(1.35); opacity: 0.7; }
  100% { transform: scale(0); opacity: 0; }
}

/* ===== SOUNDS ===== */
.sound-note {
  font-size: 0.9rem;
  color: #7a7d96;
  font-style: italic;
  text-align: center;
}
.sound-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(130px, 1fr));
  gap: 0.8rem;
  width: 100%;
}
.sound-card {
  background-color: #111528;
  border: 1px solid #1e2238;
  border-radius: 14px;
  padding: 1.1rem 0.7rem;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.5rem;
  cursor: pointer;
  transition: all 0.25s;
  user-select: none;
}
.sound-card:hover {
  border-color: #c5a97b;
  transform: translateY(-2px);
}
.sound-card.playing {
  border-color: #c5a97b;
  box-shadow: 0 0 20px rgba(197,169,123,0.2);
}
.sound-icon { font-size: 2rem; }
.sound-name {
  font-size: 0.8rem;
  letter-spacing: 0.08em;
  color: #7a7d96;
  text-align: center;
}
.sound-wave {
  display: flex;
  align-items: center;
  gap: 2px;
  height: 16px;
}
.wave-bar {
  width: 3px;
  border-radius: 2px;
  background-color: #c5a97b;
  opacity: 0;
}
.sound-card.playing .wave-bar {
  opacity: 1;
  animation: waveBounce 0.8s ease-in-out infinite;
}
.wave-bar:nth-child(1) { height: 6px; animation-delay: 0s; }
.wave-bar:nth-child(2) { height: 12px; animation-delay: 0.1s; }
.wave-bar:nth-child(3) { height: 9px; animation-delay: 0.2s; }
.wave-bar:nth-child(4) { height: 14px; animation-delay: 0.3s; }
.wave-bar:nth-child(5) { height: 7px; animation-delay: 0.15s; }
@keyframes waveBounce {
  0%, 100% { transform: scaleY(1); }
  50%       { transform: scaleY(0.35); }
}

/* ===== MANTRAS ===== */
.mantra-card {
  background-color: #111528;
  border: 1px solid #2b