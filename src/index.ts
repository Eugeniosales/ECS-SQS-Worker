import AWS from "aws-sdk";
import cron from "node-cron";
import { Message } from "aws-sdk/clients/sqs";

AWS.config.update({
  region: "us-east-2",
});

class Consumer {
  private queue: AWS.SQS;
  private queueUrl: string;

  constructor() {
    this.queue = new AWS.SQS();
    this.queueUrl =
      "https://sqs.us-east-2.amazonaws.com/805850029898/ecs-worker-queue";
  }

  async execute() {
    try {
      console.debug("Starting...");

      this.queue.receiveMessage(
        {
          MaxNumberOfMessages: 3,
          QueueUrl: this.queueUrl,
          WaitTimeSeconds: 5,
        },
        async (error, event) => {
          if (error) throw error;

          const messagesReceived = event.Messages?.length || 0;

          console.debug("Messages received =>", messagesReceived);

          if (!messagesReceived) return;

          await Promise.allSettled(
            event.Messages!.map((message) => this.handler(message))
          );
        }
      );
    } catch (error) {
      console.error("Error =>", error);
      throw error;
    }
  }

  async handler(message: Message) {
    try {
      console.debug("Message processed!", message);
      this.queue.deleteMessage(
        {
          QueueUrl: this.queueUrl,
          ReceiptHandle: message.ReceiptHandle as string,
        },
        (error, res) => {
          if (error) throw error;
          console.debug("Message deleted =>", message.MessageId);
        }
      );
    } catch (error) {
      console.error("Error =>", error);
      throw error;
    }
  }
}

cron.schedule("*/20 * * * * *", async () => {
  await new Consumer().execute();
});
