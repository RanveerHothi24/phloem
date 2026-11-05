# Phloem

A hackathon project from the EasyA x Ripple Hackathon in London (2024). Phloem is a concept for a crypto-based platform giving people in developing countries direct access to their earnings, without the delays caused by a lack of liquidity in traditional banks.

Built by a team of four over the hackathon, alongside workshops on crypto fundamentals and talks from people working in the industry.

## The idea

In many developing economies, people can wait days or weeks to access wages because local banks don't hold enough cash. Phloem pays salaries directly in tokens, so they arrive straight in the employee's wallet with no intermediary holding them up, and every payment is recorded on-chain where both sides can see it.

## This repo

This holds the payment smart contract, which was my part of the project. It's written in Solidity and:

- lets an employer pay an employee in any ERC-20 token, straight from the employer's wallet
- restricts payments to the contract owner
- emits a `SalaryPaid` event for every payment, giving a transparent, auditable record of who was paid what

The employer approves the contract to spend their tokens first, then calls `paySalary(recipient, amount)` for each payment.

## Where it would go next

- Batch payroll, paying a whole team in one transaction
- Scheduled, recurring payments
- Tests and a testnet deployment

## Team

Ranveer Hothi, Mohamed Enkissa, Sakib Imamul Hoque, Mohamed Khoualed
