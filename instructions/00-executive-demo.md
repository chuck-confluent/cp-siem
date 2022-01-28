# Executive Demonstration

You are a Confluent employee showcasing this demo for an executive audience.

## Presentation

1. Request read access to the [demo presentation](https://docs.google.com/presentation/d/1fRue23OSV_zddkXWOv4YOARvK1SHAOkffcFzms0RBsk/edit?usp=sharing)
2. Deliver the slide presentation to set the context

## Demonstration Short Version



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

### Demonstrate the Ease of Adding Source Connectors

> Confluent offers a buffet of off-the-shelf connectors to easily get data in or our of event streams.  A standard data source in Cyber defense are system logs (syslog), so lets start capturing that.

#### Add the `SyslogSourceConnector`

1. Navigate to the connect cluster in Confluent Control Center.
2. Select "add connector"
3. Select "SyslogSourceConnector"

> If you aren’t familiar with Kafka Connect, it's the easiest way to move data into or out of Confluent. You simply specify a few settings for the external system, and the connect cluster automatically starts the data flowing. No code required.

4. Set `syslog.listener` to `UDP` and `syslog.port` to `5140`.

> All I have to do with this connector is to specify which syslog protocol to use and which port to receive events on.

5. Submit the connector.

> Control center actually generates the configuration and sends it to the Connect cluster's REST API. So you can just as easily automate this using your favorite tool, or use gitops to store the connectors you need.

#### Add the `SplunkS2SSourceConnector`

“As mentioned earlier, we are a company that has Splunk deployed, including forwarders to collect data and send it straight to Splunk.  In order to optimize this data and leverage other additional tools, we want to send the data to Confluent instead.  So let's spin up another connector to receive this data.”

1. Click "add connector" and select the `SplunkS2SSourceConnector`.
2. Submit the connector.

> For this one we don’t need to specify anything at all and will just stick with the defaults.

