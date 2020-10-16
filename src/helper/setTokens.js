import { sign } from "jsonwebtoken";


export function setTokens(user) {
  const sevenDays = 60 * 60 * 24 * 7 * 1000;
  const fifteenMins = 60 * 15 * 1000;
  const accessUser = {
    id: user.id,
  };
  const accessToken = sign(
    { user: accessUser },
    Buffer.from(process.env.ACESS_TOKEN_SECRET_KEY).toString('base64'),
    {
      expiresIn: fifteenMins,
    }
  );
  const refreshUser = {
    id: user.id,
    count: user.tokenCount,
  };
  const refreshToken = sign(
    { user: refreshUser },
    Buffer.from(process.env.REFRESH_TOKEN_SECRET_KEY).toString('base64'),
    {
      expiresIn: sevenDays,
    }
  );

  return { accessToken, refreshToken };
}
