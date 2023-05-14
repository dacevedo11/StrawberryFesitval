// List of Call-Backs
// 1.  line 63
// 2.  line 105
// 3.  line 180 
// 4.  line 233
// 5.  line 259
// 6.  line 285
// 7.  line 308
// 8.  line 321 
// 9.  line 337/339
// 10. line 343

// Variables
VAR kindness = 0
VAR charm = 0
VAR guts = 0

VAR crush = ""
VAR gift = ""

VAR visitedAbigail = false
VAR visitedHaley = false
VAR visitRobin = false

VAR boughtBeer = false

VAR foundAbigail = false

VAR partner = ""

VAR success = false

Today's the day. The Strawberry Festival. I'm a little nervous though. I'm still new to Pelican Town so I don't really know anyone very well.
-> main

=== main ===
Maybe I can ask someone to dance at the Strawberry Dance! But who?
    +[Abigail]
        The goth gamer girl. Every high school dork's dream girl. A girl like Abigail would probably respond best to someone who is kind. Should I ask Abigail?
            ++[Yes]
                ~ crush = "Abigail"
                -> chooseGift
            ++[No]
                -> main
    +[Haley]
        The basic white girl. She comes off as superficial but maybe it's because shes's new here too. It would probably take a real charmer to get her to agree to a dance. Should I ask Haley?
            ++[Yes]
                ~ crush = "Haley"
                -> chooseGift
            ++[No]
                -> main
    +[Robin]
        The MILF. She's married though. Asking her to dance would take some real guts. Should I ask Robin?
            ++[Yes]
                ~ crush = "Robin"
                ~ guts = guts + 1
                -> chooseGift
            ++[No]
                ->main
    
=== chooseGift ===
Now, if I'm gonna ask her I should probably get her a gift.
I wonder what kind of gift {crush} would like?
    +[Bake a Chocolate Cake]
        I could try baking her a cake. Making something from scratch adds a personal touch too. It shows real kindness. 
        ++[Yes]
            ~ gift = "Chocolate Cake"
            ~ kindness = kindness + 1
            Perfect! I'll bake {crush} a {gift}! I'm sure she will appreciate it!
            -> getGift.Cake
        ++[No]
            ->chooseGift
    +[Pick Sunflowers]
        I could try picking some flowers. Going out in nature and finding the prettiest flowers; The pick-up lines would practically write themselves. 
            ++[Yes]
                ~ gift = "Sunflower"
                ~ charm = charm + 1
                Cool. I'll pick a {gift} for {crush}! It'll definitely sweep her off her feet!
                -> getGift.Sunflowers
            ++[No]
                -> chooseGift
    +[Buy her a Beer]
        Maybe I should buy her a drink. Maybe she'll be impressed by my straight-fowardness. She'll definitely dance with me then!
            ++[Yes]
                ~ gift = "Beer"
                ~ guts = guts + 1
                Yes. I'll just buy her a {gift} at the festival! Talk about gutsy! 
                -> timeToGo
            ++[No]
                -> chooseGift

=== getGift === 

=Cake
If I'm going to bake a cake, I'll need to buy the ingredients. Pierre's General Store should have what I need, but you can't beat JojaMart's prices.
    +[Support local businesses]
        ~ kindness = kindness + 1
        -> Pierres
    +[Not in this economy]
        -> JojaMart
        ~ kindness = kindness - 1
        
=Sunflowers
I should head out to the fields by the outskirts of Town to look for flowers!
You go out and pick the best looking {gift} you can find! As you head back to your farm, you see Haley! 
+[Say Hi]
    ~ visitedHaley = true
    Haley: "This town is sooo boring. What should I do?
    ++[Watercolor painting]
        ~ charm = charm + 1 
        Haley: "Hmm... That's a pretty good idea, actually! Thanks."
        -> timeToGo
    ++[Get a job]
        ~ charm = charm - 1 
        Haley: "Sounds like a lot of work..."
        She was not impressed...
        ->timeToGo
+[Go Home]
    ~ charm = charm - 1
    -> timeToGo
    
=== Pierres===
You head to town and into Pierre's General Store. You get the ingredients you needed, and as you are paying you hear Abigail raging from her room. 

Pierre: "That Abby and her damn video games."

Check on Abigail?

+[Yes]
    You knock on her door.
    ~ kindness = kindness + 1
    ~ visitedAbigail = true
    Abigail: "Sorry, I'm just really struggling with this game. It is ridiculously hard!"
        ++[Pass the controller]
            Abigail: "Whoa, You're really good at this."
            You beat the game single-handedly!
            Abigail: "You sure know your way around a joystick."
                -> timeToGo
        ++[Want to try it together?]
            Abigail: Really? That's so nice of you!
            You two beat the game together!
            ~ kindness = kindness + 1
            Abigail: Hey, that was fun! Thanks, I'll see you later!
                -> timeToGo
+[No]
    ~ kindness = kindness - 1
    ->timeToGo

=== JojaMart ===
You head on over to JojaMart. On your way there, you run into Robin!
-> JojaMart.loop

= loop
+[Say Hi]
    ~ visitRobin = true
    Robin: "Hey, farmer boy. I didn't see you there. What brings you to town?"
    ++[Going to JojaMart]
        Robin: "Wait, are you seriously going to JojaMart?" 
        She seems visisbly annoyed...
            +++[Me? JojaMart? No way!]
                ~ guts = guts - 1
                Robin: "Hey, it's none of my business where you shop. Now if you don't mind, I have work to do"
                    -> timeToGo
            +++[Yeah]
                ~ guts = guts + 1
                Robin: "I'm just pulling your tail, hahaha! It's seriously none of my business. Don't tell the mayor I said this, but they have some great deals! Anyway, I have work to do. I'll see you at the festival."
                    -> timeToGo
+[Mind your own business and continue to JojaMart]
    ~ guts = guts - 1
    -> timeToGo
    
+ {guts > 0} [Catcall her]
    Even at your level, you don't have the guts to do that...
    -> JojaMart.loop
        
=== timeToGo ===
Some time passes by...

You're home. There's a knock at the door. It's the mayor!
Lewis: "Howdy! I figured I'd come check on you. Ah, I see you made {gift}. Might that be for a special lady? {crush}, perhaps?

+[Next]

{crush == "Robin": Lewis: "You know, I've seen you staring at her. You know she's married woman. Fufufu, I don't think that bothers you though, does it?"}

Lewis: "I suppose there's no better time than the Strawberry Festival!

-> leaveForFestival
        
=== leaveForFestival ===
Lewis: "Anyway, we should get going."

You both head off to the Strawberry Festival.

+[Next]
-> festival

=== festival ===

{foundAbigail:
    You arrive and you see all the townsfolk gathered in the square. Abigail is in the graveyard. Haley is sitting alone. Robin is mingling.
  - else:
    You arrive and you see all the townsfolk gathered in the square. Abigail is nowhere to be found. Haley is alone. Robin is mingling.
}

{gift == "Beer" && boughtBeer == false: -> saloon}

+ {foundAbigail} [Go to Graveyard]
    ->graveyard
+ {foundAbigail == false} [Look for Abigail]
    -> abigail
+ [Speak to Haley]
    -> hailey
+ [Speak to Robin]
    -> robin

=== abigail === 
You decide to walk around town in search of Abigail. 

You pass by the graveyard and hear some noise. You decide to check it out...

It's Abigail. She's swinging a sword. Enter the graveyard? Or head back to the festival? 
~ foundAbigail = true
    +[Enter graveyard]
        -> graveyard
    +[Go back to Town Square]
        -> festival

=== graveyard ===
You enter the graveyard. Abigail notices you and approaches.

{visitedAbigail:
- true: Abigail: "Look who it is. Fancy seeing you twice in one day. Oh, this? It's my sword. I'm training. What brings you here, anyway? Wouldn't you rather be at the festival?"
- false: Abigail: "Oh, if it isn't the retired pirate. I'm just here practicing my with my sword so I can go out on adventures and stuff. What brings you here?"
}
    + [Hand her the gift]
        {gift:
        - "Chocolate Cake": Abigail: "I seriously love this! You're the best!" 
            ~ kindness = kindness + 3
        - "Sunflower": Abigail: "What were you thinking? This is awful!"
            ~ kindness = kindness - 3
        - "Beer": Abigail: "You brought me a drink? Thanks."
            ~ kindness = kindness + 1
        }
        ++[Ask Abigail to be your dance partner]
        {kindness > 4:
            Abigail: "Okay! I'd love to!"
                ~ partner = "Abigail"
                -> danceSuccess
          - else:
            Abigail: "That's flattering, really, but I'm gonna have to pass."
                -> danceFailure
        }

=== hailey ===
You decide to approach Hailey.

{visitedHaley:
- true: Haley: "Oh, it's you again. I'm just practicing my dance moves"
- false: Haley: "What do you want? I'm practicing my dance moves. It needs to be perfect."
}
    +[Hand her the gift]
        {gift:
        - "Chocolate Cake": Hailey: "Thank you. I love presents." 
            ~ charm = charm + 1
        - "Sunflower": Hailey: "Oh my god, this is my favorite thing!"
            ~ charm = charm + 3
        - "Beer": Hailey: "Gross!"
            ~ charm = charm - 3
        }
        ++[Ask Haley to be your dance partner]
        {charm > 3:
            Haley: "Okay! I'd love to!"
                ~ partner = "Haley"
                -> danceSuccess
          - else:
            Haley: "Ew! The trash boy! How dare you ask me? Get the fuck away from me or I'll scream!"
                -> danceFailure
        }

=== robin ===
You decide to approach Robin. The other ladies leave you two alone.

{visitRobin:
- true: Robin: Hey, good to see you again! Glad you could make it!
- false: Robin: Oh hey, what can I do for you? How's the farm?
}
    +[Hand her the gift]
        {gift:
        - "Chocolate Cake": Robin: "What the...? This is terrible!" 
            ~ guts = guts - 3
        - "Sunflower": Robin: "Oh, thank you."
            ~ guts = guts + 1
        - "Beer": Robin: "This is for me? Wow, I absolutely love it!"
            ~ guts = guts + 3
        }
        ++[Ask Robin to be your dance partner]
            Robin: Farmer boy? I'm married, you know. But you're actually into old ladies like me?"
            {guts > 4:
                Robin: "Okay. I suppose one dance couldn't hurt."
                ~ partner = "Robin"
                ->danceSuccess
              - else:
                Robin: "Sorry, but I'm not part of the menu today, sweetheart."
            }

=== saloon === 
I should stop by the Stadrop Saloon to get that {gift}!

You enter the Saloon! 

Gus: Howdy neighbor! What can I get for you?
    +[A Beer to Go]
        Sure thing! Here you go! Enjoy the Festival!
        ~ boughtBeer = true
        -> festival
            
=== danceSuccess ===
It's time for the Strawberry Dance!

You and {partner} danced the night away!

~ success = true

-> afterParty

=== danceFailure ===
It's time for the Strawberry Dance...

You just sit on the sidelines watching as everyone else has fun. This is like high school all over again.
-> afterParty

=== afterParty ===
A couple hours later, you and the mayor are having drinks at The Stardrop Saloon.

{success:
    Lewis: "That was some party, huh! I take it the {gift} did the trick after all?
- else:
    Lewis: "No need to look so down! There'll be other festivals! Other girls! Maybe next time, rethink getting her a {gift}.
}

{partner == "Robin" && success: 
    Lewis: "I gotta tell you, {partner}'s husband was NOT happy seeing you two dance like that! The whole town is gonna be talking about it!
}

Lewis: "Alright, I think it's about time I get going. Don't wanna keep Marnie waiting."
    The mayor stumbled out the door.
    ... Did he just admit to having an affair with Marnie?
-> END