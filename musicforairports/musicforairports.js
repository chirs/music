// http://teropa.info/blog/2016/07/28/javascript-systems-music.html#is-this-for-me

/*
Eno has compared making musical systems like these to "gardening", as opposed to "architecting". We plant the seeds for the system, but then let it grow by itself and surprise us by the music that it makes.
*/ 

const OCTAVE = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'];

const SAMPLE_LIBRARY = {
    'Grand Piano': [
        { note: 'A',  octave: 4, file: 'Samples/Grand Piano/piano-f-a4.wav' },
        { note: 'A',  octave: 5, file: 'Samples/Grand Piano/piano-f-a5.wav' },
        { note: 'A',  octave: 6, file: 'Samples/Grand Piano/piano-f-a6.wav' },
        { note: 'C',  octave: 4, file: 'Samples/Grand Piano/piano-f-c4.wav' },
        { note: 'C',  octave: 5, file: 'Samples/Grand Piano/piano-f-c5.wav' },
        { note: 'C',  octave: 6, file: 'Samples/Grand Piano/piano-f-c6.wav' },
        { note: 'D#',  octave: 4, file: 'Samples/Grand Piano/piano-f-d#4.wav' },
        { note: 'D#',  octave: 5, file: 'Samples/Grand Piano/piano-f-d#5.wav' },
        { note: 'D#',  octave: 6, file: 'Samples/Grand Piano/piano-f-d#6.wav' },
        { note: 'F#',  octave: 4, file: 'Samples/Grand Piano/piano-f-f#4.wav' },
        { note: 'F#',  octave: 5, file: 'Samples/Grand Piano/piano-f-f#5.wav' },
        { note: 'F#',  octave: 6, file: 'Samples/Grand Piano/piano-f-f#6.wav' }
    ]
};




let noteValue = function(note, octave) {
  return octave * 12 + OCTAVE.indexOf(note);
}

let getNoteDistance = function(note1, octave1, note2, octave2) {
  return noteValue(note1, octave1) - noteValue(note2, octave2);
}

let getNearestSample = function(sampleBank, note, octave) {
  let sortedBank = sampleBank.slice().sort((sampleA, sampleB) => {
    let distanceToA =
      Math.abs(getNoteDistance(note, octave, sampleA.note, sampleA.octave));
    let distanceToB =
      Math.abs(getNoteDistance(note, octave, sampleB.note, sampleB.octave));
    return distanceToA - distanceToB;
  });
  return sortedBank[0];
}





let flatToSharp = function(note) {
    switch (note) {
    case 'Bb': return 'A#';
    case 'Db': return 'C#';
    case 'Eb': return 'D#';
    case 'Gb': return 'F#';
    case 'Ab': return 'G#';
    default:   return note;
    }
}

let getSample = function(instrument, noteAndOctave) {
    let [, requestedNote, requestedOctave] = /^(\w[b\#]?)(\d)$/.exec(noteAndOctave);
    requestedOctave = parseInt(requestedOctave, 10);
    requestedNote = flatToSharp(requestedNote);
    let sampleBank = SAMPLE_LIBRARY[instrument];
    let sample = getNearestSample(sampleBank, requestedNote, requestedOctave);
    let distance =
        getNoteDistance(requestedNote, requestedOctave, sample.note, sample.octave);
    return fetchSample(sample.file).then(audioBuffer => ({
        audioBuffer: audioBuffer,
        distance: distance
    }));
    
}

function fetchSample(path) {
    return fetch(encodeURIComponent(path))
        .then(response => response.arrayBuffer())
        .then(arrayBuffer => audioContext.decodeAudioData(arrayBuffer));
}

function playSample(instrument, note, destination, delaySeconds = 0) {
  getSample(instrument, note).then(({audioBuffer, distance}) => {
    let playbackRate = Math.pow(2, distance / 12);
    let bufferSource = audioContext.createBufferSource();
    bufferSource.buffer = audioBuffer;
    bufferSource.playbackRate.value = playbackRate;
    bufferSource.connect(destination);
    bufferSource.start(audioContext.currentTime + delaySeconds);
  });
}

function startLoop(instrument, note, destination, loopLengthSeconds, delaySeconds) {
    playSample(instrument, note, destination, delaySeconds);
    setInterval(
        () => playSample(instrument, note, destination, delaySeconds),
        loopLengthSeconds * 1000
    );
}


let audioContext = new AudioContext();

fetchSample('AirportTerminal.wav').then(convolverBuffer => {
    let convolver = audioContext.createConvolver();
    convolver.buffer = convolverBuffer;
    convolver.connect(audioContext.destination);

    startLoop('Grand Piano', 'F4',  convolver, 19.7, 4.0);
    startLoop('Grand Piano', 'Ab4', convolver, 17.8, 8.1);
    startLoop('Grand Piano', 'C5',  convolver, 21.3, 5.6);
    startLoop('Grand Piano', 'Db5', convolver, 22.1, 12.6);
    startLoop('Grand Piano', 'Eb5', convolver, 18.4, 9.2);
    startLoop('Grand Piano', 'F5',  convolver, 20.0, 14.1);
    startLoop('Grand Piano', 'Ab5', convolver, 17.7, 3.1);
    
});




// While the simple setInterval() based solution will work just fine for us, I should mention that it is not precise enough for most Web Audio applications. This is because JavaScript does not give exact guarantees about the timing of setInterval(). If something else is making the computer busy at the moment when the timer should fire, it may get delayed. It's not at all uncommon for this to happen. For our purposes though, I actually like that it's a bit inexact.



