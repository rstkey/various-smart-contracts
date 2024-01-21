use borsh::{BorshDeserialize, BorshSerialize};
use solana_program::{
    account_info::{next_account_info, AccountInfo},
    entrypoint,
    entrypoint::ProgramResult,
    msg,
    program_error::ProgramError,
    pubkey::Pubkey,
};

/// Defining the type of state stored in accounts.
#[derive(BorshSerialize, BorshDeserialize, Debug)]
pub struct CounterAccount {
    pub counter: u32,
}

// Declare and export the program's entrypoint.
entrypoint!(process_instruction);

// process_instruction function get the instruction as input and execute it.
pub fn process_instruction(
    program_id: &Pubkey,
    accounts: &[AccountInfo],
    _instruction_data: &[u8],
) -> ProgramResult {
    msg!("Increment Solana program");

    let accounts_iter = &mut accounts.iter();

    let account = next_account_info(accounts_iter)?;

    if account.owner != program_id {
        msg!("Account does not have the correct program id");
        return Err(ProgramError::IncorrectProgramId);
    }

    let mut counter_account = CounterAccount::try_from_slice(&account.data.borrow())?;
    counter_account.counter += 1;
    counter_account.serialize(&mut &mut account.data.borrow_mut()[..])?;

    msg!("Current count is: {}", counter_account.counter);

    Ok(())
}
