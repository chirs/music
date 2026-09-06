// http://teropa.info/blog/2016/07/28/javascript-systems-music.html#is-this-for-me

// Fetch API: https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch
// fetch() returns back to us a Promise object
// What we do with the Promise is call its .then() method and supply it with a callback function

let audioContext = new AudioContext();

/* 
And now we come to the real technical trick that underlies "It's Gonna Rain":
What we are hearing are two identical tape loops playing at the same time. 
There's one in the left ear and one in the right. 
But one of those loops is running ever so slightly faster than the other.
...
Brian Eno has likened this process to a moiré pattern, where two simple identical geometrical patterns are superimposed to give rise to something much more complex than the original.
*/

let startLoop = function(audioBuffer, pan = 0, rate = 1){
    // our very first audio-processing graph, which consists of just two nodes, one connected to the next:
    // An AudioBufferSourceNode that reads in the AudioBuffer data and streams it to other nodes.
    // The AudioContext's built-in AudioDestinationNode, which makes the sound audible on the machine's speakers.
    let sourceNode = audioContext.createBufferSource();
    let pannerNode = audioContext.createStereoPanner();
    
    sourceNode.buffer = audioBuffer;
    sourceNode.loop = true;
    sourceNode.loopStart = 2.98;
    sourceNode.loopEnd = 3.80;
    sourceNode.playbackRate.value = rate;
    pannerNode.pan.value = pan;

    sourceNode.connect(pannerNode);
    pannerNode.connect(audioContext.destination);

    sourceNode.start(0, 2.98);    
}

fetch('its_gonna_rain_part_i_1965.mp3')
    .then(response => response.arrayBuffer())
    .then(arrayBuffer => audioContext.decodeAudioData(arrayBuffer))
    .then(audioBuffer => {
        startLoop(audioBuffer, -1);
        startLoop(audioBuffer, 1, 1.002);
    })
    .catch(e => console.error(e));

