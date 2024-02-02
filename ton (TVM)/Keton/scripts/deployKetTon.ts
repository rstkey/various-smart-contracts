import { toNano } from '@ton/core';
import { KetTon } from '../wrappers/KetTon';
import { NetworkProvider } from '@ton/blueprint';

export async function run(provider: NetworkProvider) {
    const ketTon = provider.open(await KetTon.fromInit());

    await ketTon.send(
        provider.sender(),
        {
            value: toNano('0.05'),
        },
        {
            $$type: 'Deploy',
            queryId: 0n,
        }
    );

    await provider.waitForDeploy(ketTon.address);

    // run methods on `ketTon`
}
