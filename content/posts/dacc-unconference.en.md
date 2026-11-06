---
title: "Building Buurtbox v0.1 for the DACC Digitale Autonomie Unconference"
date: 2026-11-05T14:00:00+01:00
draft: false
description: "How an unconference at DACC pushed Buurtbox from concept into a physical prototype in two days."
thumbnail: "images/posts/dacc-unconference/components.jpg"
---

As a part of the Buurtbox project, I have been researching existing projects that touch on resilience and autonomy. That is how I came across the Digital Autonomy Competence Center (DACC).

<!--more-->

The DACC helps public institutions move away from Big Tech and toward local, autonomous, and open source alternatives. Thematically, that is a very good match for Buurtbox. By stroke of luck, DACC was about to host a conference:

The Digitale Autonomie Unconference.

I signed up and started thinking about how to prepare. The unconference concept confused me at first. What did it mean exactly?

Apparently the idea is simple: anyone interested can pitch an idea, attendants vote on what they want to join, and the session itself is free-form.

Buurtbox was still in the conceptual and planning phase, and a lot was still unknown. Hardware choices, design choices, what data should actually live on the box. Still, I felt I would make a stronger impact if I could bring a physical thing to the table.

So I set my mind to it and started designing a prototype. The core of the idea is a highly portable, low-power computer attached to a high-capacity battery pack that acts as a server. I went with the following stack:

- Raspberry Pi 5 (8GB)
- SanDisk MicroSDXC Extreme 64GB
- Anker Prime Powerbank
- SanDisk Extreme Portable SSD 1TB
- IP65 waterproof junction box
- Spacers and cables

![Buurtbox hardware components: Raspberry Pi, SSD, powerbank, and enclosure parts.](/images/posts/dacc-unconference/components.jpg)

Once the hardware was in, it took me about a day to get everything neatly into the enclosure and have a basic server running on the Raspberry Pi. I flashed Raspberry Pi OS to the SanDisk microSD, then configured SSH over my local network.

The Raspberry Pi is mounted in the enclosure on tall spacers and the SSD sits under it. The powerbank is attached along the left side.

I thought I had bought a reasonably big enclosure and that everything would fit easily. In practice, I spent a lot of time shuffling components. I had not thought enough about where all ports were located on the SSD, Raspberry Pi, and battery pack. Power and data cables also do not like perfect 90 degree angles. I think I assembled and dismantled everything four or five times.

Ultimately it was not really a problem, just Tetris with different blocks.

![Buurtbox v0.1 assembled in the enclosure for the first time.](/images/posts/dacc-unconference/first-assembly.jpg)

At the end of day 1, I had a device running that I could SSH into and turn into a hotspot. When it functioned as a hotspot, it redirected users to a placeholder captive portal. Awesome.

Day 2 was all software.

I replaced the placeholder captive portal with a Rails app that works as a dashboard. It runs in Docker and boots when the Raspberry Pi powers on. This would be the home environment we could extend with many services.

Of course I was still operating with a lot of assumptions. What kind of data or services need to be available on a device like this?

The first thing I set up was Kiwix. Kiwix is an open source offline browser that reads .zim files. There is a lot of data available in .zim format, and I expected that to be the main use of the 1TB drive:

Full offline multilingual Wikipedia. A wide variety of maps. A large medical database. iFixit repair manuals.

I was comfortable calling the device Buurtbox now.

As I was uploading all this data, I quickly realized 1TB is a lot. I can put way, way more stuff on this thing. Discoverability of data, with good search or a basic AI assistant, will be a key feature later on.

It was tempting to keep filling it with data, but time was limited and there was more to do. I decided to add a few more features as applications. The Raspberry Pi with 8GB memory is powerful enough to host multiple app servers.

I added PairDrop for file exchange between devices on the network, Kanboard for open source kanban workflows, and Nextcloud for tools like calendar and contact management. Each one runs in its own Docker container.

Finally I made all services available in the captive portal by embedding them with iframes in the Rails app.

To top it off, I tested the whole setup with multiple phones and laptops. No bugs, other than some UX rough edges around responsiveness.

I printed a few simple labels, and called it a day.

Buurtbox v0.1 is live.

Conference day arrived and I visited the AMS Institute office at the Marineterrein in Amsterdam. The day started with a kickoff presentation. The unconference format was explained briefly, and people who wanted to host sessions could present themselves.

I was among the attendees pitching an idea and got placed in the afternoon group.

For the morning group, I joined a session about driving change toward autonomy from within an organization. It was a very interesting session with people from a wide range of organizations. The morning flew by, then there was a short lunch before the next sessions started.

I pitched the question: how local does something have to be before it is considered autonomous?

A number of attendees joined and the session kicked off.

I used Buurtbox as the starting point for discussion and got many useful questions. Right now Buurtbox is positioned as a local data backup for communities that stays accessible during total blackout.

Some participants pointed out that a similar idea could also be relevant for businesses, as a way to keep services available when systems go down. From there we explored where a hub like this fits, and where it does not.

For large organizations, we concluded that larger local backup infrastructure makes more sense, like on-prem servers combined with backup generators. Buurtbox is better suited to neighbourhood scale.

Then we zoomed back out to the core question. Does autonomy mean having everything in the same building, or is it enough to organize things nationally or, in our case, within the EU?

We did not land on one final answer, and I do not think there is one. Autonomy feels less like a fixed line and more like a spectrum. Every step closer to home gives more control, but also more responsibility.

![Session discussion at the DACC Digitale Autonomie Unconference. Photo credit: DACC.](/images/posts/dacc-unconference/dacc-session.jpg)

Back in the presentation room, each group gave a short debrief, and that wrapped up the day.

I left with a head full of new questions and a lot of valuable feedback for Buurtbox. A physical prototype turned out to be a great conversation starter.

Now it is time to turn those conversations into the next version.

![After-conference drinks at the DACC Digitale Autonomie Unconference. Photo credit: DACC.](/images/posts/dacc-unconference/dacc-drinks.jpg)

*Photo attribution: The two conference photos above are credited to the Digital Autonomy Competence Center (DACC).*
