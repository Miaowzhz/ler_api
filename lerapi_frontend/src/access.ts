/**
 * @see https://umijs.org/docs/max/access#access
 * */
export default function access(initialState: { currentUser?: API.userInfo } | undefined) {
  const { currentUser } = initialState ?? {};
  return {
    canUser: currentUser,
    canAdmin: currentUser && currentUser.userRole === 'admin',
  };
}
/**
 * @see https://umijs.org/zh-CN/plugins/plugin-access
 * */
// export default function access(initialState: InitialState | undefined) {
//   const { loginUser } = initialState ?? {};
//   return {
//     canUser: loginUser,
//     canAdmin: loginUser?.userRole === 'admin',
//   };
// }
