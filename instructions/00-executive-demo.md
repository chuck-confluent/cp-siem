# Executive Demonstration

You are a Confluent employee showcasing this demo for an executive audience.

## Presentation

1. Request read access to the [demo presentation](https://docs.google.com/presentation/d/1fRue23OSV_zddkXWOv4YOARvK1SHAOkffcFzms0RBsk/edit?usp=sharing)
2. Deliver the slide presentation to set the context

## Demonstration Script

Launch the Gitpod workspace by clicking the link:
- https://gitpod.io/#DEMO_MODE=true/https://github.com/confluentinc/demo-siem-optimization

Say a few words while it starts.

> Here I'm starting a containerized lab environment that will automatically do a lot on launch.

> I am going to demonstrate how Confluent can help you optimize your existing SIEM investment, while at the same time improving their cyber defense capabilities.

> In this demonstration, we take the role of a company that uses Splunk as its SIEM solution. We already have Splunk agents in place and potentially other tools like rsyslog or Zeek/Corelight. All of this data is either being dropped, or going straight into Splunk.

>  This demo will show four advantages of using Confluent: 
>1. Real-time threat detection directly in the streams of data.
>2. Decrease your Splunk costs by filtering and aggregating the data before it lands in Splunk.
>3. Gain insights from high volume data too expensive to index
>4. Avoid vendor lock-in so that you can take advantage of the strengths of different SIEM vendors.

### Explore Control Center

Open Confluent Control Center by launching a new tab for port `9021` from Remote Explorer (see [Gitpod tips](./gitpod-tips.md)).

> What you are seeing here are a number of topics that already exist in this newly spun up environment. Topics are how different streams of data are organized.  Most of these topics are receiving PCAP data streaming in through a Zeek container. Zeek is a common tool in cyber defense -- it's an open source network sensor that reads packet traffic and produces metadata about that activity on the network.  For instance you can see topics for socket connections, dns queries, http requests, running applications, etc. Zeek is a good example of one of the many tools in this domain that have native support for producing directly into Confluent. Other examples are things like syslog-ng, r-syslog, beats, blue coat proxy, etc.

> We also have some precreated topics that will be used by our real-time stream processors. One of those for instance is topic with domain name watch lists. But we'll look at that later.

### 