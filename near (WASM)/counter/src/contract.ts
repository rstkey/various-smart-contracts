import { NearBindgen, near, call, view } from 'near-sdk-js';

@NearBindgen({})
class CounterContract {
  counter: number = 0;

  @view({})
  get_counter(): number {
    return this.counter;
  }

  @call({})
  update({ counter }: { counter: number }): void {
    near.log(`Saving counter ${counter}`);
    this.counter = counter;
  }

  @call({})
  increaseByOne(): void {
    near.log(`Saving counter ${this.counter++}`);
    this.counter++;
  }
}
