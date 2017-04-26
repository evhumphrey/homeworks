 // Write a function that takes three strings - a verb, an adjective, and a noun - uppercases and interpolates them into the sentence "We shall VERB the ADJECTIVE NOUN". Use ES6 template literals.

 function madLib(verb, adj, noun) {
   verb = verb.toUpperCase();
   adj = adj.toUpperCase();
   noun = noun.toUpperCase();

   console.log(`We shall ${verb} the ${adj} ${noun}`);
 }

madLib('make', 'best', 'guac');
