 event_inherited();

if (timer >= time * 2) timer = 0;
else timer++;

if (timer < time) zsp = 1;
else if (timer > time && timer < time*2) zsp = -1;	

z += zsp;