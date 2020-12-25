import { sign } from "jsonwebtoken";

export async function setTokens(user) {
  const sevenDays = 60 * 60 * 24 * 7 * 1000;
  const oneDay = 24 * 60 * 60 * 1000;
  let data = await user.getRoles();
  let roles = data.map((role) => role.toJSON().role);
  const accessUser = {
    id: user.id,
    roles: roles,
  };

  const accessToken = sign(
    { user: accessUser },
    Buffer.from(process.env.ACESS_TOKEN_SECRET_KEY).toString("base64"),
    {
      expiresIn: sevenDays,
      algorithm: "HS256",
    }
  );
  const refreshUser = {
    id: user.id,
    count: user.tokenCount,
  };
  const refreshToken = sign(
    { user: refreshUser },
    Buffer.from(process.env.REFRESH_TOKEN_SECRET_KEY).toString("base64"),
    {
      algorithm: "HS256",
      expiresIn: sevenDays,
    }
  );

  return { accessToken, refreshToken };
}
