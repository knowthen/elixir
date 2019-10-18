# Companion Repo for the course: Elixir & Phoenix for Beginners

> "Use the right tool for the job"

The above statement is conventional wisdom that I'm sure most of us programmers
would generally agree with, but let me ask you this, do you think each of the 20
most popular programming languages are different tools meant for different jobs?

For example, consider the following five programming languages: Java, Python,
Ruby, JavaScript, and C#. 

Are these five languages so unique that you'd call them different tools meant
for different jobs or do they seem more alike than they are different?

There was a time when you could say *"JavaScript is a language that runs in the
browser"*, however that statement doesn't work anymore... Today JavaScript is a
language that you can use almost everywhere: Browsers, Servers, Embedded
Devices, Databases... So is JavaScript the right tool for every job? **NO, of
course not! but people keep trying**

I think if you squint your eyes, the vast majority of popular programming
languages look more similar than different.  Sure, they all have different
styles and idioms, that may or may not resonate with you, but I still think most
popular languages, fundamentally aren't all that different.

### Why do I think this?

Because most popular languages were designed to be general-purpose, sequential
languages that can solve all sorts of problems.  I mean, if you think about it,
languages only become popular, when they have broad appeal, and can be used to
solve many different problems... right?

But here's the thing, you can't write a programming language that's excellent at
solving all possible problems, just like you'll never be able to make a meal
that everyone likes.

### Ok, so what am I getting at?

This course teaches you the [Elixir programming
language](https://elixir-lang.org/), which you should know, isn't like any
other popular languages.

Elixir is a modern **concurrent functional** programming language, that solves
certain types of problems, in a unique, novel and a very effective way...  In
other words, Elixir is clearly a different tool, meant for certain types of
jobs.

I'm going to explain what Elixir is really good at in a moment, but before I do,
ponder the following statement:

> Elixir is a language that allows you to write software that can effectively
> **"run forever"**...

Ok before you send me a nasty email, nothing runs forever... I know that, but
programs written with Elixir can have ridiculous uptimes, far longer than
any other languages except for Erlang, but I'll talk more about Erlang in a
moment.

### So, how is it that Elixir programs can effectively "run forever"?

Well, it doesn't happen by accident... this is possible in Elixir because in
part, that's what it was designed to do.

So when would you use Elixir? In other words, what kind of **"problems"** is it
good at solving?

Well, Elixir is excellent for creating **web applications and APIs** that are
highly responsive, massively concurrent, fault-tolerant and distributed.

Elixir is also really good at creating [embedded
software](https://nerves-project.org/), but in this course, we'll focus on
Elixir, in the context of web development.

Ok, you might be thinking, *"I can create web applications and APIs in plenty of
languages, so how's Elixir different?"*

If I had to give just one answer to this question, my answer would be: **"Elixir
handles concurrency far better than any other popular language!"**

I'll give you some examples:

A few years ago [B/R (Bleacher Report)](https://bleacherreport.com/), a sports
news site, was experiencing significant growth (billions of monthly page views)
and was running into scaling issues. B/R was originally created with **ROR (Ruby
on Rails)**, which offers a great developer experience and productivity, but it
kind of sucks at scaling and concurrency.

Some companies have been able to scale ROR, by effective use of caching, but
caching isn't something B/R could use, because each B/R user has a personalized
news feed, which doesn't lend itself to caching.

Initially, B/R dealt with their growth challenges, by adding more and more
servers, but eventually they decided to look at alternatives to ROR, that could
help them address their scaling challenges, so they looked at a few different
languages such as JavaScript/Node.js and Golang, but they eventually chose
Elixir, and they started migrating from ROR to Elixir &
[Phoenix](https://phoenixframework.org/).

After migrating the resource-intensive services from ROR to Elixir, B/R was able
to go from 150 ROR servers, down to just [5 Elixir
servers](https://www.techworld.com/apps-wearables/how-elixir-helped-bleacher-report-handle-8x-more-traffic-3653957/),
and they felt like they could have gone down to just 2 Elixir servers, but they
were extra cautious and they preferred to over-provisioning a bit.

Going from 150 to just 5 servers is pretty impressive, but there's more to
Elixir than just scaling, but I'll get to that in a moment.

Let's look at another Elixir success story in [Discord](https://discordapp.com/)
which is a startup that provides a text chat and voice service for gamers.

Discord knew from the very beginning, that they'd need to build a highly
concurrent system and they boldly chose Elixir from the start... I say *boldly*
because they committed to Elixir very early, well before it was a proven
technology.

After about 2 years of service, Discord was servicing [5 million concurrent
users](https://blog.discordapp.com/scaling-elixir-f9b8e1e7c29b), then a couple
years later, they were servicing [11 million concurrent
users](https://blog.discordapp.com/using-rust-to-scale-elixir-for-11-million-concurrent-users-c6f19fc029d3).

Now, Discord is at a scale most of us will never have to deal with, and as such,
they've found several hot spots in their code that required creative solutions,
but they've been able to make it work quite well, and here's the **kicker**,
when they had 5 million concurrent users, they only had **4 infrastructure
engineers**.

Ok, you might be saying to yourself *"I don't have scaling challenges like B/R
and Discord, so why would I use Elixir"*?

Well, even if you don't have scaling challenges today, it's nice to know you're
creating software that can scale when needed, but even if you never need the
massive concurrency that Elixir offers, you should still consider Elixir for a
bunch of other reasons. I'll describe a few of the big ones:

- **Concurrency**: because of how concurrency is handled with Elixir, there are
    features you get in Elixir that other languages can't offer. For example,
    implementing **real-time** features in Elixir and Phoenix is trivial,
    especially compared to other popular languages.

- **Responsiveness**: Elixir is very responsive and offers **consistent 
    low-latency responses** because of features like preemptive scheduling and
    how garbage collection is implemented... in other words, with Elixir you'll be
    able to offer more *consistent, stable and reliable services*.

- **Availability**: it's relatively easy to create **highly available services**
    with Elixir because distributed computing/clustering is a native feature. 

- **Fault-tolerance**: because of how fault-tolerance works in Elixir, *errors and
    bugs are isolated* and typically have no impact on other parts of the
    system. In other words, it's virtually impossible to have bugs that take
    down your whole server, and with Elixir, you won't find yourself restarting
    servers to recover from bad errors or bugs.

By the way, if you wanted to write software that could **"run forever"**, you'd
need all the features I just described, right?

Elixir is a very capable language that offers many unique and interesting
features, but it also offers an excellent developer experience, similar to what
Ruby on Rails offers... Basically, with Elixir you can create excellent systems,
with unique features, that scale well and are maintainable, and you'll find
yourself very productive and you'll probably really enjoy using it.

### "Ok, but Elixir is young, so I'm sure there are plenty of growing pains you'll need to endure, right?"

Well **no**, not exactly, let me explain.

Programs you write in Elixir, are compiled into bytecode that runs in a virtual
machine. The virtual machine that Elixir uses wasn't created for Elixir, it was
originally created over 3 decades ago for a language called Erlang.

The truth is, Elixir is nothing without the Erlang Virtual Machine, in fact
Elixir wouldn't even exist, without Erlang.

Now, Erlang has most of the same features that Elixir has, which might make you
wonder, why not just use Erlang?

Well, if you look at Erlang, it isn't the nicest language to read and use...
In fairness, most languages that were created over 3 decades ago, can't really
compete aesthetically with modern languages. Now, some people actually like
Erlang, but I suspect most people who take a cursory look at Erlang are quickly
turned off by it's syntax.

The reason I'm telling you about Erlang is because its virtual machine (which
Elixir uses) is mature, battle-tested and rock-solid, so even though Elixir is a
relatively new language, it's runtime is more mature and proven than pretty much
every other runtime.

### "Ok, but what about changes to the language and the APIs? Are they stable?"

Recently, [José Valim](https://twitter.com/josevalim), the creator of Elixir,
was asked: 

> ["Is Elixir done?"](https://elixirforum.com/t/is-elixir-done/20830/12) 

José's answer was effectively **Yes**... well he didn't say yes, he preferred to
call it stable... Basically, there are no big features or breaking changes on
the roadmap, and there are no firm plans for a version 2.0...  well, I bet there
will be a version 2.0 at some point, but hopefully, you get the sentiment, about
the **maturity of the language**.

I'm pretty sure we're past most of the growing pains with Elixir, and it's a
great time to learn and start using Elixir, but don't take my word for it,
look at what others are saying, like
[InfoQ](https://www.infoq.com/articles/programming-language-trends-2019/) and
Gartner Research, who say it's ready for
[prime-time](https://dockyard.com/blog/2019/04/19/business-benefits-of-elixir)
and they're suggesting that organizations start considering Elixir because it
can provide a competitive advantage.

### "Do many companies use Elixir? i.e. are there many Elixir Jobs?"

Yep, you can find hundreds of companies that use Elixir, in this
[list](http://elixir-companies.com/), but I suspect there are actually thousands
of companies using Elixir, with more adopting it every day... You're probably
familiar with some of the companies that use Elixir, such as Pinterest, Moz,
Slack, Pepsi, PagerDuty, AdRoll, Bleacher Report, and  Discord.

### "What will I learn in this course?"

We'll start with the basics, and work our way through the major features in
Elixir, then we'll start learning the Phoenix web framework.

There are more than **150 videos, totaling ~17.5 hours** of video content that
covers the following topics, and much more:

- Data Types
- Pattern matching
- Flow Control
    - If/Then, Unless
    - Cond
    - Case
- Functions
  - Anonymous and Named
  - Higher Order Functions
  - Pattern matching & Guards
  - Pure vs Impure
  - Pipe Operator
  - Recursion
  - Tail Call Optimization
- Collection Processing
  - Map, Filter, Reduce, etc
  - Composition with the pipe operator
  - Streams
  - Comprehensions
- Protocols
- Macros
- Build tools
- Testing
- Functional Programming Concepts
- Processes
  - Long-Lived & Short-Lived
  - Sending and Receiving Messages
  - Error Handling
  - Supervisors
- OTP 
  - GenServers
  - Supervisors
  - Applications
  - Agents & Tasks
- Phoenix Web Framework

After you've learned the basics, you'll put what you've learned into practice
by building an interesting final project.

### "What's the final project?"

Imagine that you and I are on a team that just landed a big contract to **build
an exit polling application**.

**"What is exit polling?"**

Well, it's a way of estimating how people are voting on election day, and the
estimates are determined by asking a sampling of voters who they voted for,
immediately after they leave the polling booth.

This project is a **bit scary**, because, before election day almost nobody will
be using our application, however, on election day, our app will experience a
**massive spike in usage**... somewhere between 10,000 to 100,000 concurrent
users.

Let me explain the expected usage pattern, in more detail.

Leading up to election day, there will be just a few users, setting up the
master data... In other words, adding the voting districts, the questions to ask
voters, and the valid choices for each question.

  ![master data example](https://knowthen.com/images/elixir_exit_poll_master-data.png)

On election day, there will be a huge spike in usage. A small part of the usage
spike will be from people conducting the exit polls, on their mobile phones.

  ![Polling page example](https://knowthen.com/images/elixir_exit_poll_poll.png)

However, the vast majority of concurrent users will be pollsters, political
campaigns and news organizations that will be monitoring the exit polling
results all-day long. 

  ![Exit poll result page - updated in
  real-time](https://knowthen.com/images/elixir_exit_poll_results.png) 

So basically, there will be 3 parts to our final project: 
1. An admin area for adding and maintaining master data.
2. A polling section, which will be used to conduct exit polls.
3. And lastly, there will be a reporting section, which displays the exit
   polling results and **updates them in real-time**, as new polls are
   conducted.

The admin part of the app will consist of several server-rendered crud pages.

The Polling and Reporting parts of the app will be a single page app, written in
React.js.  We **won't** create the React app in this course, as it's outside the
scope of this course, but we will create several **rest endpoints** and a
**phoenix channel** that will get used in the React.js app, then we'll integrate
the React app with Phoenix.

### "How do you solve this type of concurrency/scaling challenge?"

Well, you're going to need to take the course to find out, but just so you know,
the solution we'll create is very different from what you'd do in other popular
languages.

### "Is this course right for me?"

This course is meant for students who are already familiar with HTML, CSS, and
HTTP.

Ideally, you should have some experience with another programming language...
In other words, I'm assuming you have at least a small amount of general
programming knowledge.
This isn't to say a total newbie can't succeed in this course, but I think it
would be pretty challenging.

### "What's included in this course?"

This course has **150+ videos**, totaling **~17.5 hours**, of thoughtfully
created content covering Elixir version 1.9 and Phoenix version 1.4. You'll also
have plenty of **exercises and challenges** throughout the course, to give you
some practice and to keep you engaged.

### Course Preview

You can watch the [first few
videos](https://courses.knowthen.com/p/elixir-and-phoenix-for-beginners) to
see what we'll be covering, and to get a bit of an overview.

### "What if I don't like the course?"

I offer a **no questions asked, 30-day money-back guarantee**. So, if for any
reason, you'd like a refund, just shoot me an [email](mailto:james@knowthen.com)
within 30 days of your purchase, and I'll promptly provide a refund.

<p class="mv4"><a
href="https://courses.knowthen.com/purchase?product_id=1385008" class="f3 link
dim ph4 pv3 mv7 white bg-blue">Buy Now</a></p>
